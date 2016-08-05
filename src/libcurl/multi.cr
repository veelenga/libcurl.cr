require "./curl"

@[Link("libcurl")]
lib Multi
  alias Curl = Void
  alias Curlm = Void

  alias Int = LibC::Int
  alias Char = LibC::Char
  alias Long = LibC::Long
  alias UInt = LibC::UInt
  alias Short = LibC::Short
  alias SocketT = LibC::Int

  alias Curlcode = Curl::Curlcode

  enum Curlmcode
    CurlmCallMultiPerform = -1
    CurlmOk               =  0
    CurlmBadHandle        =  1
    CurlmBadEasyHandle    =  2
    CurlmOutOfMemory      =  3
    CurlmInternalError    =  4
    CurlmBadSocket        =  5
    CurlmUnknownOption    =  6
    CurlmAddedAlready     =  7
    CurlmLast             =  8
  end

  enum Curlmoption
    CurlmoptSocketfunction           = 20001
    CurlmoptSocketdata               = 10002
    CurlmoptPipelining               =     3
    CurlmoptTimerfunction            = 20004
    CurlmoptTimerdata                = 10005
    CurlmoptMaxconnects              =     6
    CurlmoptMaxHostConnections       =     7
    CurlmoptMaxPipelineLength        =     8
    CurlmoptContentLengthPenaltySize = 30009
    CurlmoptChunkLengthPenaltySize   = 30010
    CurlmoptPipeliningSiteBl         = 10011
    CurlmoptPipeliningServerBl       = 10012
    CurlmoptMaxTotalConnections      =    13
    CurlmoptLastentry                =    14
  end

  enum CurlmsgEnum
    CurlmsgNone = 0
    CurlmsgDone = 1
    CurlmsgLast = 2
  end

  struct Curlmsg
    msg : CurlmsgEnum
    easy_handle : Curl*
    data : CurlmsgData
  end

  struct Waitfd
    fd : Int
    events : Short
    revents : Short
  end

  struct FdSet
    fds_bits : Int[32]
  end

  union CurlmsgData
    whatever : Void*
    result : Curlcode
  end

  fun init = curl_multi_init : Curlm*
  fun strerror = curl_multi_strerror(x0 : Curlmcode) : Char*
  fun socket = curl_multi_socket(multi_handle : Curlm*, s : SocketT, running_handles : Int*) : Curlmcode
  fun socket_action = curl_multi_socket_action(multi_handle : Curlm*, s : SocketT, ev_bitmask : Int, running_handles : Int*) : Curlmcode
  fun socket_all = curl_multi_socket_all(multi_handle : Curlm*, running_handles : Int*) : Curlmcode
  fun timeout = curl_multi_timeout(multi_handle : Curlm*, milliseconds : Long*) : Curlmcode
  fun setopt = curl_multi_setopt(multi_handle : Curlm*, option : Curlmoption, ...) : Curlmcode
  fun wait = curl_multi_wait(multi_handle : Curlm*, extra_fds : Waitfd*, extra_nfds : UInt, timeout_ms : Int, ret : Int*) : Curlmcode
  fun perform = curl_multi_perform(multi_handle : Curlm*, running_handles : Int*) : Curlmcode
  fun cleanup = curl_multi_cleanup(multi_handle : Curlm*) : Curlmcode
  fun info_read = curl_multi_info_read(multi_handle : Curlm*, msgs_in_queue : Int*) : Curlmsg*
  fun remove_handle = curl_multi_remove_handle(multi_handle : Curlm*, handle : Curl*) : Curlmcode
  fun add_handle = curl_multi_add_handle(multi_handle : Curlm*, handle : Curl*) : Curlmcode
  fun fdset = curl_multi_fdset(multi_handle : Curlm*, read_fd_set : FdSet*, write_fd_set : FdSet*, exc_fd_set : FdSet*, max_fd : Int*) : Curlmcode
  fun assign = curl_multi_assign(multi_handle : Curlm*, sockfd : SocketT, sockp : Void*) : Curlmcode
end
