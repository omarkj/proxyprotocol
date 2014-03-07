require "proxyprotocol/header"

module ProxyProtocol
  class TCPSocket < TCPSocket
    include Header
    def initialize(remote_host, remote_port, source_ip=nil, source_port=nil, 
                   dest_ip=nil, dest_port=nil, local_host=nil, local_port=nil)
      super(remote_host, remote_port, local_host, local_port)
      header = proxy_protocol_header(source_ip, source_port, dest_ip,
                                     dest_port)
      write(header)
    end
  end
end
