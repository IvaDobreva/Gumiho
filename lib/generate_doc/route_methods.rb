require 'net/http'
require 'openssl'
require 'json'

module JSON
  def self.is_json?(foo)
    begin
      return false unless foo.is_a?(String)
      JSON.parse(foo).all?
    rescue JSON::ParserError
      false
    end 
  end
end


module GenerateDoc

  #Returns hash with routes
  def get_routes(path, ssl)
    uri = URI(path)
    uri.query = URI.encode_www_form({ :doc => true })
  
    http = Net::HTTP.new(uri.host, uri.port)
    
    p 'Cannot handle SSL' if ssl==true

    response = http.get(uri)
   
    json_data = JSON.parse(response.body)
    return json_data
  end   
  
  # GET request
  def get_method(path, ssl)
    uri = URI(path)

    uri.query = URI.encode_www_form({ :doc => true })
    http = Net::HTTP.new(uri.host, uri.port)  

    p 'Cannot handle SSL' if ssl==true
   
    response = http.get(uri)
   
    #Checks if JSON response is right
    if JSON.is_json?(response.body)
      json_data = JSON.parse(response.body)
    end

  end

  #POST request
  def post_method(path, ssl)
    
    uri = URI(path)

    request = Net::HTTP::Post.new(uri.path)

    p 'Cannot handle SSL' if ssl==true
    
    request.set_form_data({:doc=>true})
  
    response = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(request)
    end
    
    if JSON.is_json?(response.body)
      json_data = JSON.parse(response.body)
    end

  end

  #PUT request
  def put_method(path, ssl)
    uri = URI(path)
    http = Net::HTTP.new(uri.host, uri.port)

    p 'Cannot handle SSL' if ssl==true

    request = Net::HTTP::Put.new(path)
    request.set_form_data({:doc=>true })
    response = http.request(request)

    if JSON.is_json?(response.body)
      json_data = JSON.parse(response.body)
    end

  end
  
  #DELETE request
  def delete_method(path, ssl)
    uri = URI(path)
    
    http = Net::HTTP.new(uri.host, uri.port)

    p 'Cannot handle SSL' if ssl==true

    response = http.delete(path)
  
    if JSON.is_json?(response.body)
      json_data = JSON.parse(response.body)
    end
    
  end

end
