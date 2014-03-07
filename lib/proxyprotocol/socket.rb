require "socket"

module ProxyProtocol
  class Socket < Socket
    include Header
    def initialize(domain, socktype, protocol=0, source_ip=nil, source_port=nil,
                   dest_ip=nil, dest_port=nil, local_host=nil, local_port=nil)
      @header = proxy_protocol_header(source_ip, source_port, dest_ip,
                                      dest_port)
      super(domain, socktype, protocol=0)
    end

    def connect(remote_sockaddr)
      super
      write(@header)
    end
  end
end
