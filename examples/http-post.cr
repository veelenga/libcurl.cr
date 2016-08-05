require "../src/libcurl/easy"

# https://curl.haxx.se/libcurl/c/http-post.html
if curl = Easy.init
  Easy.setopt(curl, Easy::Curloption::CurloptUrl, "http://google.com")
  Easy.setopt(curl, Easy::Curloption::CurloptPostfields, "name=vitalii&project=libcurl.cr")
  Easy.setopt(curl, Easy::Curloption::CurloptVerbose, 1)
  Easy.perform(curl)
  Easy.cleanup(curl)
else
  puts "Unable to initialize Curl"
end
