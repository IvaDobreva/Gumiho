$:.unshift File.dirname(__FILE__)
require 'gumiho/route_methods'
require 'gumiho/path_config'
require 'gumiho/generate_response.rb'
require 'yaml'
 
module Gumiho
  
  extend self

    def generate_documentation(params, export_dir)
      #Checks for command line parameters and load them
      
      #Check for config file
      if params[:config]

        if File.file?(params[:config])
          #parses yaml config file and creates PathConfig 
          yaml = YAML.load_file(params[:config])
           
          path_conf = PathConfig.new(yaml['generate_strategy'], 
                                    yaml['http']['hostname'], 
                                    yaml['http']['port'],
                                    yaml['http']['path'])
          template_file = yaml['template']

	else

          abort('Wrong file')

        end

      else  
        #Creates new PathConfig object with following params
        path_conf = PathConfig.new(params[:protocol], params[:hostname],
                                   params[:port], params[:route])

        template_file = params[:template]

	if params[:settings]
		puts "Current path is: #{path_conf.build_path}"
		puts "Template is: #{template_file}"
		exit
	end
      end

      routes_hash = routes_get(path_conf.build_path)
      response = []
      
      routes_hash.each do |route|
        
        if route_filter(route['path'])==false
          path = path_conf.build_path(route['path']) 
         
          params[:methods].each do |method|
            case method
            when 'GET' 
              response << { :method => 'GET', 
                            :url => path, 
                            :response => get_method(path) 
                          } if route['method'].downcase == 'get'
            when 'POST'
              response << { :method => 'POST', 
                            :url => path, 
                            :response => post_method(path) 
                          } if route['method'].downcase == 'post'
            when 'PUT' 
              response << { :method => 'PUT', 
                            :url => path, 
                            :response => put_method(path) 
                          } if route['method'].downcase == 'put'
            when 'DELETE'
              response << { :method => 'DELETE', 
                            :url => path, 
                            :response => delete_method(path) 
                          } if route['method'].downcase == 'delete'
            end
          end
        end

      end
      
      generate_response(response, template_file, export_dir)
  
    end
end
