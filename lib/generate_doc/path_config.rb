
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
    def build_path
      @link = "#{@protocol}://#{@hostname}:#{@port}#{@path}"
    end       

    def get_method_route(path)
      @route = "#{@protocol}://#{@hostname}:#{@port}#{path}"
    end
 
  end

end
