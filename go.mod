module go.wandrs.dev/framework

go 1.16

require (
	code.gitea.io/gitea-vet v0.2.1
	gitea.com/lunny/levelqueue v0.3.0
	github.com/NYTimes/gziphandler v1.1.1
	github.com/PuerkitoBio/goquery v1.6.1
	github.com/alecthomas/chroma v0.9.1
	github.com/caddyserver/certmagic v0.13.1
	github.com/chi-middleware/proxy v1.1.1
	github.com/denisenkom/go-mssqldb v0.10.0
	github.com/dgrijalva/jwt-go v3.2.0+incompatible
	github.com/dustin/go-humanize v1.0.0
	github.com/editorconfig/editorconfig-core-go/v2 v2.4.2
	github.com/go-chi/chi/v5 v5.0.3
	github.com/go-chi/cors v1.2.0
	github.com/go-ldap/ldap/v3 v3.3.0
	github.com/go-redis/redis/v8 v8.4.0
	github.com/go-sql-driver/mysql v1.6.0
	github.com/go-swagger/go-swagger v0.27.0
	github.com/go-testfixtures/testfixtures/v3 v3.6.1
	github.com/gobwas/glob v0.2.3
	github.com/gogs/chardet v0.0.0-20191104214054-4b6791f73a28
	github.com/gogs/cron v0.0.0-20171120032916-9f6c956d3e14
	github.com/google/uuid v1.2.0
	github.com/gorilla/context v1.1.1
	github.com/gorilla/schema v1.2.0
	github.com/issue9/identicon v1.2.0
	github.com/jaytaylor/html2text v0.0.0-20200412013138-3577fbdbcff7
	github.com/json-iterator/go v1.1.12
	github.com/kballard/go-shellquote v0.0.0-20180428030007-95032a82bc51
	github.com/lafriks/xormstore v1.4.0
	github.com/lib/pq v1.10.2
	github.com/markbates/goth v1.67.1
	github.com/mattn/go-isatty v0.0.13
	github.com/mattn/go-sqlite3 v1.14.7
	github.com/mholt/archiver/v3 v3.5.0
	github.com/microcosm-cc/bluemonday v1.0.9
	github.com/minio/minio-go/v7 v7.0.10
	github.com/modern-go/reflect2 v1.0.2
	github.com/msteinert/pam v0.0.0-20201130170657-e61372126161
	github.com/nfnt/resize v0.0.0-20180221191011-83c6a9932646
	github.com/olekukonko/tablewriter v0.0.5 // indirect
	github.com/oliamb/cutter v0.2.2
	github.com/pquerna/otp v1.3.0
	github.com/prometheus/client_golang v1.10.0
	github.com/quasoft/websspi v1.0.0
	github.com/shurcooL/httpfs v0.0.0-20190707220628-8d4bc4ba7749 // indirect
	github.com/shurcooL/vfsgen v0.0.0-20200824052919-0d455de96546
	github.com/ssor/bom v0.0.0-20170718123548-6386211fdfcf // indirect
	github.com/stretchr/testify v1.7.0
	github.com/syndtr/goleveldb v1.0.0
	github.com/tstranex/u2f v1.0.0
	github.com/unknwon/com v1.0.1
	github.com/unknwon/i18n v0.0.0-20210321134014-0ebbf2df1c44
	github.com/unknwon/paginater v0.0.0-20200328080006-042474bd0eae
	github.com/unrolled/render v1.4.0
	github.com/urfave/cli/v2 v2.3.0
	github.com/yohcop/openid-go v1.0.0
	github.com/yuin/goldmark v1.3.7
	github.com/yuin/goldmark-highlighting v0.0.0-20210516132338-9216f9c5aa01
	github.com/yuin/goldmark-meta v1.0.0
	go.bytebuilders.dev/license-proxyserver v0.0.3
	go.jolheiser.com/hcaptcha v0.0.4
	go.jolheiser.com/pwn v0.0.3
	go.wandrs.dev/binding v0.0.0-20210531104511-aa760cf3a6c4
	go.wandrs.dev/cache v0.0.0-20210531105734-7f9e41f0042f
	go.wandrs.dev/captcha v0.0.0-20210531101847-946666b98836
	go.wandrs.dev/session v0.0.0-20210531080514-72628304c241
	go.wandrs.dev/session/couchbase v0.0.0-20210531080514-72628304c241
	go.wandrs.dev/session/memcache v0.0.0-20210531080514-72628304c241
	go.wandrs.dev/session/mysql v0.0.0-20210531080514-72628304c241
	go.wandrs.dev/session/postgres v0.0.0-20210531080514-72628304c241
	golang.org/x/crypto v0.6.0
	golang.org/x/net v0.7.0
	golang.org/x/sys v0.0.0-20210525143221-35b2ab0089ea
	golang.org/x/text v0.3.6
	golang.org/x/tools v0.1.0
	gopkg.in/alexcesaro/quotedprintable.v3 v3.0.0-20150716171945-2caba252f4dc // indirect
	gopkg.in/gomail.v2 v2.0.0-20160411212932-81ebce5c23df
	gopkg.in/ini.v1 v1.62.0
	gopkg.in/yaml.v2 v2.4.0
	mvdan.cc/xurls/v2 v2.2.0
	strk.kbt.io/projects/go/libravatar v0.0.0-20191008002943-06d1c002b251
	xorm.io/builder v0.3.9
	xorm.io/xorm v1.1.0
)

replace github.com/lafriks/xormstore => github.com/wandrs/xormstore v1.4.1-0.20210604161001-ac29d1fa6fc4
