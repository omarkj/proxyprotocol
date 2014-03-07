require "ipaddr"

module ProxyProtocol
  module Header
    def proxy_protocol_header(source_ip, source_port, dest_ip, dest_port)
      if [source_ip, source_port, dest_ip, dest_port].include?(nil)
        "PROXY UNKNOWN\r\n"
      else
        source_ip = IPAddr.new(source_ip) unless source_ip.kind_of?(IPAddr)
        dest_ip = IPAddr.new(dest_ip) unless dest_ip.kind_of?(IPAddr)
        version = ip_version(source_ip, dest_ip)
        "PROXY #{version} #{source_ip.to_s} #{dest_ip.to_s} #{source_port} #{dest_port}\r\n"
      end
    end
    
    def ip_version(source_ip, dest_ip)
      if source_ip.ipv4? and dest_ip.ipv4?
        "TCP4"
      elsif source_ip.ipv6? and dest_ip.ipv6?
        "TCP6"
      end
    end
  end
end
