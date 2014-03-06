require 'proxyprotocol'
require 'socket'

describe "Proxyprotocol::TCPSocket" do

  it "should send the proxy protocol header" do
    server_socket = TCPServer.new("127.0.0.1", 0)
    result = nil
    thread = Thread.new do
      client = server_socket.accept
      result = client.gets
      client.close
    end
    server_port = server_socket.addr[1]
    socket = Proxyprotocol::TCPSocket.new("127.0.0.1", server_port,
                                          "10.0.0.1", 1000,
                                          "192.168.1.1", 80)
    thread.join
    result.should eql("PROXY TCP4 10.0.0.1 192.168.1.1 1000 80\r\n")
  end

  it "should send unknown protocol header" do
    server_socket = TCPServer.new("127.0.0.1", 0)
    result = nil
    thread = Thread.new do
      client = server_socket.accept
      result = client.gets
      client.close
    end
    server_port = server_socket.addr[1]
    socket = Proxyprotocol::TCPSocket.new("127.0.0.1", server_port)
    thread.join
    result.should eql("PROXY UNKNOWN\r\n")
  end

end
