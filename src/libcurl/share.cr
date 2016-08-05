require "./curl"

@[Link("libcurl")]
lib Share
  alias Curlsh = Void
  alias Char = LibC::Char

  enum Curlshoption
    CurlshoptNone       = 0
    CurlshoptShare      = 1
    CurlshoptUnshare    = 2
    CurlshoptLockfunc   = 3
    CurlshoptUnlockfunc = 4
    CurlshoptUserdata   = 5
    CurlshoptLast       = 6
  end

  enum Curlshcode
    CurlsheOk         = 0
    CurlsheBadOption  = 1
    CurlsheInUse      = 2
    CurlsheInvalid    = 3
    CurlsheNomem      = 4
    CurlsheNotBuiltIn = 5
    CurlsheLast       = 6
  end

  fun init = curl_share_init : Curlsh*
  fun setopt = curl_share_setopt(x0 : Curlsh*, option : Curlshoption, ...) : Curlshcode
  fun cleanup = curl_share_cleanup(x0 : Curlsh*) : Curlshcode
  fun strerror = curl_share_strerror(x0 : Curlshcode) : Char*
end
