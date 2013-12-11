$:.unshift File.dirname(__FILE__)
require 'generate_doc/route_methods'
require 'generate_doc/path_config'
require 'generate_doc/command_line_params'
require 'generate_doc/generate_response.rb'
require 'yaml'
 
module GenerateDoc
  extend self

  #Checks for command line parameters and load them
  params = get_cl_params
  
  #Check for config file
  if params[:config]

    if File.file?(params[:config])
      #parses yaml config file and creates PathConfig 
      yaml = YAML.load_file(params[:config])
       
      path_conf = PathConfig.new(yaml['generate_strategy'], 
                                yaml['http']['hostname'], 
                                yaml['http']['port'],
                                yaml['http']['path'],
                                yaml['http']['ssl'])
      template_file = yaml['template']
    else

      abort('Wrong file')

    end

  else 
    #Creates new PathConfig object with following params
    
    #Checks SSL param from the command line
    ssl = false
    if params[:ssl]=='true'
      ssl = true
    end    

    path_conf = PathConfig.new(params[:protocol], params[:hostname],
                               params[:port], params[:route], ssl)

    template_file = params[:template]
  end
  
  routes_hash = get_method(path_conf.build_path, path_conf.ssl)
  
  response = []
  
  routes_hash.each do |route|
    
    if route_filter(route['path'])==false
      path = path_conf.get_method_route(route['path']) 
     
      params[:methods].each do |method|
        case method
        when 'GET'
          response << { :method => 'GET', :url => path, :response => get_method(path, path_conf.ssl) }
        when 'POST'
          response << { :method => 'POST', :url => path, :response => post_method(path, path_conf.ssl) }     
        when 'PUT'
          response << { :method => 'PUT', :url => path, :response => put_method(path, path_conf.ssl) }
        when 'DELETE'
          response << { :method => 'DELETE', :url => path, :response => delete_method(path, path_conf.ssl) }
        end

      end
    end

  end
  
  generate_response(response, template_file)
  
end
