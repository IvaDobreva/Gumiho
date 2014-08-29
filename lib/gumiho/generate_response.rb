require 'awesome_print'
require 'erb'
require 'json'

module Gumiho

  def generate_response(response, template_file, export_dir)
    template = File.open(template_file, 'r').read
    erb = ERB.new(template)
    File.open(File.join(File.dirname(export_dir), File.basename(export_dir)), 'w+') { 
      |file| file.write(erb.result(binding)) 
    }
  end

###Methods used in the template file
  def parse_response(response, template_param)
    params = template_param.split('.')
    result = response
    params.each do |param|
      result = result[param] if result.class == Hash
    end

    result
  end

######CHECK HTTTP REQUEST STATUS !!!!!
  def check_status(response, template_param)
    status = parse_response(response, template_param)
  end
######

  def map_array(response, template_param)
    result = Array.new
    data = parse_response(response, template_param)

    #Checks for wrong or empty array
    if data.class == Array and data.empty? == false
      result.push(data)
    end
    
    result.each do |param|
     # ap param
      param.each do |one_param|
        yield one_param
      end
    end

  end

  def map_string(response, template_param)
    data = parse_response(response, template_param)
  end

end
