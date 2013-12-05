require 'nokogiri'
require 'erb'
require 'json'

module GenerateDoc

  def generate_response(response, template_file)

    template = File.open(template_file, 'r').read
    erb = ERB.new(template)
    File.open("report.html", 'w+') { 
      |file| file.write(erb.result(binding)) 
    }

  end

  def map_array(template_param, response)
    params = template_param.split('.')
    data = response
    result = Array.new
    params.each do |param|
      data = data[param]
    end
    if data.class == Array and data.empty? == false
      result.push(data)
    end
    
    result.each do |param|
      param.each do |one_param|
        yield one_param
      end
    end
  end

  def map_string(response, template_param)
    params = template_param.split('.')
    
    data = response
  
    params.each do |param|
      data = data[param]
    end
    return data   
  end

end
