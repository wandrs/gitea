// Copyright 2019 The Gitea Authors. All rights reserved.
// Use of this source code is governed by a MIT-style
// license that can be found in the LICENSE file.

package integrations

import (
	"net/http"
	"net/http/httptest"
	"os"
	"path/filepath"
	"testing"

	"go.wandrs.dev/framework/modules/setting"
	"go.wandrs.dev/framework/modules/util"
	"go.wandrs.dev/framework/routers/routes"
	"go.wandrs.dev/session"

	jsoniter "github.com/json-iterator/go"
	"github.com/stretchr/testify/assert"
)

func getSessionID(t *testing.T, resp *httptest.ResponseRecorder) string {
	cookies := resp.Result().Cookies()
	found := false
	sessionID := ""
	for _, cookie := range cookies {
		if cookie.Name == setting.SessionConfig.CookieName {
			sessionID = cookie.Value
			found = true
		}
	}
	assert.True(t, found)
	assert.NotEmpty(t, sessionID)
	return sessionID
}

func sessionFile(tmpDir, sessionID string) string {
	return filepath.Join(tmpDir, sessionID[0:1], sessionID[1:2], sessionID)
}

func sessionFileExist(t *testing.T, tmpDir, sessionID string) bool {
	sessionFile := sessionFile(tmpDir, sessionID)
	_, err := os.Lstat(sessionFile)
	if err != nil {
		if os.IsNotExist(err) {
			return false
		}
		assert.NoError(t, err)
	}
	return true
}

func TestSessionFileCreation(t *testing.T) {
	defer prepareTestEnv(t)()

	oldSessionConfig := setting.SessionConfig.ProviderConfig
	defer func() {
		setting.SessionConfig.ProviderConfig = oldSessionConfig
		c = routes.NormalRoutes()
	}()

	var config session.Options

	json := jsoniter.ConfigCompatibleWithStandardLibrary
	err := json.Unmarshal([]byte(oldSessionConfig), &config)
	assert.NoError(t, err)

	config.Provider = "file"

	// Now create a temporaryDirectory
	tmpDir, err := os.MkdirTemp("", "sessions")
	assert.NoError(t, err)
	defer func() {
		if _, err := os.Stat(tmpDir); !os.IsNotExist(err) {
			_ = util.RemoveAll(tmpDir)
		}
	}()
	config.ProviderConfig = tmpDir

	newConfigBytes, err := json.Marshal(config)
	assert.NoError(t, err)

	setting.SessionConfig.ProviderConfig = string(newConfigBytes)

	c = routes.NormalRoutes()

	t.Run("NoSessionOnViewIssue", func(t *testing.T) {
		defer PrintCurrentTest(t)()

		req := NewRequest(t, "GET", "/user2/repo1/issues/1")
		resp := MakeRequest(t, req, http.StatusOK)
		sessionID := getSessionID(t, resp)

		// We're not logged in so there should be no session
		assert.False(t, sessionFileExist(t, tmpDir, sessionID))
	})
	t.Run("CreateSessionOnLogin", func(t *testing.T) {
		defer PrintCurrentTest(t)()

		req := NewRequest(t, "GET", "/user/login")
		resp := MakeRequest(t, req, http.StatusOK)
		sessionID := getSessionID(t, resp)

		// We're not logged in so there should be no session
		assert.False(t, sessionFileExist(t, tmpDir, sessionID))

		doc := NewHTMLParser(t, resp.Body)
		req = NewRequestWithValues(t, "POST", "/user/login", map[string]string{
			"_csrf":     doc.GetCSRF(),
			"user_name": "user2",
			"password":  userPassword,
		})
		resp = MakeRequest(t, req, http.StatusFound)
		sessionID = getSessionID(t, resp)

		assert.FileExists(t, sessionFile(tmpDir, sessionID))
	})
}
