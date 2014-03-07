require 'proxyprotocol'
require 'socket'

describe "ProxyProtocol::TCPSocket" do
  it "should send the proxy protocol header via TCPSocket" do
    server_socket = TCPServer.new("127.0.0.1", 0)
    result = nil
    thread = Thread.new do
      client = server_socket.accept
      result = client.gets
      client.close
    end
    server_port = server_socket.addr[1]
    socket = ProxyProtocol::TCPSocket.new("127.0.0.1", server_port,
                                          "10.0.0.1", 1000,
                                          "192.168.1.1", 80)
    thread.join
    expect(result).to eq("PROXY TCP4 10.0.0.1 192.168.1.1 1000 80\r\n")
  end

  it "should send unknown protocol header via TCPSocket" do
    server_socket = TCPServer.new("127.0.0.1", 0)
    result = nil
    thread = Thread.new do
      client = server_socket.accept
      result = client.gets
      client.close
    end
    server_port = server_socket.addr[1]
    socket = ProxyProtocol::TCPSocket.new("127.0.0.1", server_port)
    thread.join
    expect(result).to eq("PROXY UNKNOWN\r\n")
  end

  it "should send the proxy protocol header via Socket" do
    server_socket = TCPServer.new("127.0.0.1", 0)
    result = nil
    thread = Thread.new do
      client = server_socket.accept
      result = client.gets
      client.close
    end
    server_port = server_socket.addr[1]
    socket = ProxyProtocol::Socket.new(Socket::AF_INET, Socket::SOCK_STREAM, 0, 
                                       "10.0.0.1", 1000, "192.168.1.1", 80)
    sockaddr = ProxyProtocol::Socket.pack_sockaddr_in(server_port, "127.0.0.1")
    socket.connect(sockaddr)
    thread.join
    expect(result).to eq("PROXY TCP4 10.0.0.1 192.168.1.1 1000 80\r\n")
  end

  it "should send the proxy protocol header via Socket" do
    server_socket = TCPServer.new("127.0.0.1", 0)
    result = nil
    thread = Thread.new do
      client = server_socket.accept
      result = client.gets
      client.close
    end
    server_port = server_socket.addr[1]
    socket = ProxyProtocol::Socket.new(Socket::AF_INET, Socket::SOCK_STREAM, 0)
    sockaddr = ProxyProtocol::Socket.pack_sockaddr_in(server_port, "127.0.0.1")
    socket.connect(sockaddr)
    thread.join
    expect(result).to eq("PROXY UNKNOWN\r\n")
  end

end
