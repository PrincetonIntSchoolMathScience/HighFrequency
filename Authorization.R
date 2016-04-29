library(ROAuth)
my_oauth <- OAuthFactory$new(consumerKey="jdSAHb015qT5Z7z4ywSIffT5t",
                             consumerSecret="3wSEbttwrPI3sOVlEVjtfgpJzfbhM028Pj0SAu4NQmIkMiS0AP", requestURL=	"https://api.twitter.com/oauth/request_token",
                             accessURL="https://api.twitter.com/oauth/access_token", authURL=	"https://api.twitter.com/oauth/authorize")
my_oauth$handshake(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))
save(my_oauth,file = "my_oauth.Rdata")
