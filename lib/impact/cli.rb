# -*- encoding: utf-8 -*-

module Impact
  class Server < Sinatra::Base

    if ARGV.any?
      require 'optparse'

      OptionParser.new { |op|
        op.on('-p port', 'set the port (default is 4567)') { |val| set :port, val.to_i }
        op.on('-o addr', 'set the host (default is 0.0.0.0)') { |val| set :bind, val }
        op.on('-e env', 'set the environment (default is development)') { |val| set :environment, val.to_sym }
        op.on('-s server', 'specify rack server/handler (default is thin)') { |val| set :server, val }
        op.on('-r root', 'specify root directory (default is current)') { |val| set :root, val }
        op.on('-x', 'turn on the mutex lock (default is off)') { set :lock, true }
      }.parse!(ARGV.dup)
    end

    at_exit { Impact::Server.run! if $!.nil? }

  end # Server
end # Impact
