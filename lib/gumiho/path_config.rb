
module Gumiho

  class PathConfig
  
    attr_reader  :hostname, :port, :protocol

    def initialize(protocol, hostname, port, path)
      @protocol = protocol
      @hostname = hostname
      @port = port
      @path = path
    end

    #Builds path from given params
    def build_path(other=nil)
      return @route = "#{@protocol}://#{@hostname}:#{@port}#{@path}" if other==nil
      return @route = "#{@protocol}://#{@hostname}:#{@port}#{other}"
    end       
 
  end

end
