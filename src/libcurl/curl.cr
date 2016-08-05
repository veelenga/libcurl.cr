@[Link("libcurl")]
lib Curl
  alias Int = LibC::Int
  alias Char = LibC::Char
  alias Long = LibC::Long
  alias UInt = LibC::UInt
  alias TimeT = LibC::Long
  alias SizeT = LibC::SizeT
  alias Short = LibC::Short
  alias Int64T = LibC::LongLong

  alias FormgetCallback = (Void*, Char*, SizeT -> SizeT)
  alias MallocCallback = (SizeT -> Void*)
  alias FreeCallback = (Void* -> Void)
  alias ReallocCallback = (Void*, SizeT -> Void*)
  alias StrdupCallback = (Char* -> Char*)
  alias CallocCallback = (SizeT, SizeT -> Void*)

  enum Khtype
    CurlkhtypeUnknown = 0
    CurlkhtypeRsa1    = 1
    CurlkhtypeRsa     = 2
    CurlkhtypeDss     = 3
  end

  enum Curlfiletype
    CurlfiletypeFile        = 0
    CurlfiletypeDirectory   = 1
    CurlfiletypeSymlink     = 2
    CurlfiletypeDeviceBlock = 3
    CurlfiletypeDeviceChar  = 4
    CurlfiletypeNamedpipe   = 5
    CurlfiletypeSocket      = 6
    CurlfiletypeDoor        = 7
    CurlfiletypeUnknown     = 8
  end

  enum Curlformoption
    CurlformNothing        =  0
    CurlformCopyname       =  1
    CurlformPtrname        =  2
    CurlformNamelength     =  3
    CurlformCopycontents   =  4
    CurlformPtrcontents    =  5
    CurlformContentslength =  6
    CurlformFilecontent    =  7
    CurlformArray          =  8
    CurlformObsolete       =  9
    CurlformFile           = 10
    CurlformBuffer         = 11
    CurlformBufferptr      = 12
    CurlformBufferlength   = 13
    CurlformContenttype    = 14
    CurlformContentheader  = 15
    CurlformFilename       = 16
    CurlformEnd            = 17
    CurlformObsolete2      = 18
    CurlformStream         = 19
    CurlformLastentry      = 20
  end

  enum Curlformcode
    CurlFormaddOk            = 0
    CurlFormaddMemory        = 1
    CurlFormaddOptionTwice   = 2
    CurlFormaddNull          = 3
    CurlFormaddUnknownOption = 4
    CurlFormaddIncomplete    = 5
    CurlFormaddIllegalArray  = 6
    CurlFormaddDisabled      = 7
    CurlFormaddLast          = 8
  end

  enum Curlcode
    CurleOk                      =  0
    CurleUnsupportedProtocol     =  1
    CurleFailedInit              =  2
    CurleUrlMalformat            =  3
    CurleNotBuiltIn              =  4
    CurleCouldntResolveProxy     =  5
    CurleCouldntResolveHost      =  6
    CurleCouldntConnect          =  7
    CurleFtpWeirdServerReply     =  8
    CurleRemoteAccessDenied      =  9
    CurleFtpAcceptFailed         = 10
    CurleFtpWeirdPassReply       = 11
    CurleFtpAcceptTimeout        = 12
    CurleFtpWeirdPasvReply       = 13
    CurleFtpWeird227Format       = 14
    CurleFtpCantGetHost          = 15
    CurleHttp2                   = 16
    CurleFtpCouldntSetType       = 17
    CurlePartialFile             = 18
    CurleFtpCouldntRetrFile      = 19
    CurleObsolete20              = 20
    CurleQuoteError              = 21
    CurleHttpReturnedError       = 22
    CurleWriteError              = 23
    CurleObsolete24              = 24
    CurleUploadFailed            = 25
    CurleReadError               = 26
    CurleOutOfMemory             = 27
    CurleOperationTimedout       = 28
    CurleObsolete29              = 29
    CurleFtpPortFailed           = 30
    CurleFtpCouldntUseRest       = 31
    CurleObsolete32              = 32
    CurleRangeError              = 33
    CurleHttpPostError           = 34
    CurleSslConnectError         = 35
    CurleBadDownloadResume       = 36
    CurleFileCouldntReadFile     = 37
    CurleLdapCannotBind          = 38
    CurleLdapSearchFailed        = 39
    CurleObsolete40              = 40
    CurleFunctionNotFound        = 41
    CurleAbortedByCallback       = 42
    CurleBadFunctionArgument     = 43
    CurleObsolete44              = 44
    CurleInterfaceFailed         = 45
    CurleObsolete46              = 46
    CurleTooManyRedirects        = 47
    CurleUnknownOption           = 48
    CurleTelnetOptionSyntax      = 49
    CurleObsolete50              = 50
    CurlePeerFailedVerification  = 51
    CurleGotNothing              = 52
    CurleSslEngineNotfound       = 53
    CurleSslEngineSetfailed      = 54
    CurleSendError               = 55
    CurleRecvError               = 56
    CurleObsolete57              = 57
    CurleSslCertproblem          = 58
    CurleSslCipher               = 59
    CurleSslCacert               = 60
    CurleBadContentEncoding      = 61
    CurleLdapInvalidUrl          = 62
    CurleFilesizeExceeded        = 63
    CurleUseSslFailed            = 64
    CurleSendFailRewind          = 65
    CurleSslEngineInitfailed     = 66
    CurleLoginDenied             = 67
    CurleTftpNotfound            = 68
    CurleTftpPerm                = 69
    CurleRemoteDiskFull          = 70
    CurleTftpIllegal             = 71
    CurleTftpUnknownid           = 72
    CurleRemoteFileExists        = 73
    CurleTftpNosuchuser          = 74
    CurleConvFailed              = 75
    CurleConvReqd                = 76
    CurleSslCacertBadfile        = 77
    CurleRemoteFileNotFound      = 78
    CurleSsh                     = 79
    CurleSslShutdownFailed       = 80
    CurleAgain                   = 81
    CurleSslCrlBadfile           = 82
    CurleSslIssuerError          = 83
    CurleFtpPretFailed           = 84
    CurleRtspCseqError           = 85
    CurleRtspSessionError        = 86
    CurleFtpBadFileList          = 87
    CurleChunkFailed             = 88
    CurleNoConnectionAvailable   = 89
    CurleSslPinnedpubkeynotmatch = 90
    CurleSslInvalidcertstatus    = 91
    CurlLast                     = 92
  end

  enum Sslbackend
    CurlsslbackendNone      =  0
    CurlsslbackendOpenssl   =  1
    CurlsslbackendGnutls    =  2
    CurlsslbackendNss       =  3
    CurlsslbackendObsolete4 =  4
    CurlsslbackendGskit     =  5
    CurlsslbackendPolarssl  =  6
    CurlsslbackendCyassl    =  7
    CurlsslbackendSchannel  =  8
    CurlsslbackendDarwinssl =  9
    CurlsslbackendAxtls     = 10
  end

  enum Curlversion
    CurlversionFirst  = 0
    CurlversionSecond = 1
    CurlversionThird  = 2
    CurlversionFourth = 3
    CurlversionLast   = 4
  end

  struct Slist
    data : Char*
    next : Slist*
  end

  struct Httppost
    next : Httppost*
    name : Char*
    namelength : Long
    contents : Char*
    contentslength : Long
    buffer : Char*
    bufferlength : Long
    contenttype : Char*
    contentheader : Slist*
    more : Httppost*
    flags : Long
    showfilename : Char*
    userp : Void*
  end

  struct Fileinfo
    filename : Char*
    filetype : Curlfiletype
    time : TimeT
    perm : UInt
    uid : Int
    gid : Int
    size : Int64T
    hardlinks : Long
    strings : FileinfoStrings
    flags : UInt
    b_data : Char*
    b_size : SizeT
    b_used : SizeT
  end

  struct FileinfoStrings
    time : Char*
    perm : Char*
    user : Char*
    group : Char*
    target : Char*
  end

  struct Sockaddr
    family : Int
    socktype : Int
    protocol : Int
    addrlen : UInt
    addr : SockaddrAddr
  end

  struct SockaddrAddr
    sa_len : UInt8
    sa_family : UInt8
    sa_data : Char[14]
  end

  struct Khkey
    key : Char*
    len : SizeT
    keytype : Khtype
  end

  struct Forms
    option : Curlformoption
    value : Char*
  end

  struct Certinfo
    num_of_certs : Int
    certinfo : Slist**
  end

  struct Tlssessioninfo
    backend : Sslbackend
    internals : Void*
  end

  struct VersionInfoData
    age : Curlversion
    version : Char*
    version_num : UInt
    host : Char*
    features : Int
    ssl_version : Char*
    ssl_version_num : Long
    libz_version : Char*
    protocols : Char**
    ares : Char*
    ares_num : Int
    libidn : Char*
    iconv_ver_num : Int
    libssh_version : Char*
  end

  fun version = curl_version : Char*
  fun version_info = curl_version_info(x0 : Curlversion) : VersionInfoData*

  fun global_init = curl_global_init(flags : Long) : Curlcode
  fun global_init_mem = curl_global_init_mem(flags : Long, m : MallocCallback, f : FreeCallback, r : ReallocCallback, s : StrdupCallback, c : CallocCallback) : Curlcode
  fun global_cleanup = curl_global_cleanup

  fun free = curl_free(p : Void*)
  fun getenv = curl_getenv(variable : Char*) : Char*
  fun getdate = curl_getdate(p : Char*, unused : TimeT*) : TimeT

  fun strequal = curl_strequal(s1 : Char*, s2 : Char*) : Int
  fun strnequal = curl_strnequal(s1 : Char*, s2 : Char*, n : SizeT) : Int

  fun slist_free_all = curl_slist_free_all(x0 : Slist*)
  fun slist_append = curl_slist_append(x0 : Slist*, x1 : Char*) : Slist*

  fun escape = curl_escape(string : Char*, length : Int) : Char*
  fun unescape = curl_unescape(string : Char*, length : Int) : Char*

  fun formfree = curl_formfree(form : Httppost*)
  fun formget = curl_formget(form : Httppost*, arg : Void*, append : FormgetCallback) : Int
  fun formadd = curl_formadd(httppost : Httppost**, last_post : Httppost**, ...) : Curlformcode
end
