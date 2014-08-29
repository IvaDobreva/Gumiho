
module GenerateDoc

  class PathConfig
  
    attr_reader :ssl, :hostname, :port, :protocol

    def initialize(protocol, hostname, port, path, ssl)
      @protocol = protocol
      @hostname = hostname
      @port = port
      @path = path
      @ssl = ssl
    end

    #Builds path from given params
    def build_path(other=nil)
      return @route = "#{@protocol}://#{@hostname}:#{@port}#{@path}" if other==nil
      return @route = "#{@protocol}://#{@hostname}:#{@port}#{other}"
    end       
 
  end

end
