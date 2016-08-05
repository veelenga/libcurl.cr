require "../src/libcurl/easy"

# https://curl.haxx.se/libcurl/c/curl_easy_perform.html#EXAMPLE
if curl = Easy.init
  Easy.setopt(curl, Easy::Curloption::CurloptUrl, "http://swapi.co/api/planets/1/")
  Easy.setopt(curl, Easy::Curloption::CurloptVerbose, 1)
  Easy.perform(curl)
  Easy.cleanup(curl)
else
  puts "Unable to initialize Curl"
end
