require 'net/http'
require 'openssl'
require 'json'
require 'awesome_print'

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
  
  def print_processing_url_method(url, method)
    puts "Processing URL: #{url} via method #{method}"
  end

  def check_if_json(response_body)
    if JSON.is_json?(response_body)
      json_data = JSON.parse(response_body)
    end
  end

  # GET request
  def get_method(path, ssl)
    uri = URI(path)

    uri.query = URI.encode_www_form({ :doc => true })
    http = Net::HTTP.new(uri.host, uri.port)  

    puts 'Cannot handle SSL' if ssl==true
    print_processing_url_method(uri, 'GET')

    response = http.get(uri)
  
    #Checks if JSON response is right
    check_if_json(response.body)
   
  end

  #POST request
  def post_method(path, ssl)
    
    uri = URI(path)

    request = Net::HTTP::Post.new(uri.path)

    puts 'Cannot handle SSL' if ssl==true
    print_processing_url_method(uri, 'POST')

    request.set_form_data({:doc=>true})
  
    response = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(request)
    end
   
    check_if_json(response.body)

  end

  #PUT request
  def put_method(path, ssl)
    uri = URI(path)
    http = Net::HTTP.new(uri.host, uri.port)

    puts 'Cannot handle SSL' if ssl==true
    print_processing_url_method(uri, 'PUT')

    request = Net::HTTP::Put.new(path)
    request.set_form_data({:doc=>true })
    response = http.request(request)
    
    check_if_json(response.body)

  end
  
  #DELETE request
  def delete_method(path, ssl)
    uri = URI(path)
    http = Net::HTTP.new(uri.host, uri.port)

    p 'Cannot handle SSL' if ssl==true
    print_processing_url_method(uri, 'DELETE')

    response = http.delete(path)
    
    check_if_json(response.body)
    
  end

  #Example filter for routes containing given substring used in generate_doc
  def route_filter(path)
    path.include? 'time'
  end

end
