# Proxyprotocol

A `Proxyprotocol::TCPSocket` that inherits `TCPSocket` to provide the
[proxy protocol](http://haproxy.1wt.eu/download/1.5/doc/proxy-protocol.txt)
header on connect.

## Installation

Add this line to your application's Gemfile:

    gem 'proxyprotocol'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install proxyprotocol

## Usage

Use it like `TCPSocket`.

``` ruby
socket = Proxyprotocol::TCPSocket.new(RemoteHost, RemotePort, SourceIp,
SourcePort, DestIp, DestPort)
```

## Run the tests

``` bash
$ bundle exec rspec
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/proxyprotocol/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
