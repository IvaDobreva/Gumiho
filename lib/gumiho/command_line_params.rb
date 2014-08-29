require 'choice'

module Gumiho
 
  def get_cl_params
 
    spec = Gem::Specification.find_by_name("gumiho")
    gem_root = spec.gem_dir
    template = gem_root + "/lib/gumiho/template/template.html.erb"
   
    Choice.options do 
      header ''
      header 'Specific options:'

      option :config do
        short '-c'
        long '--config'
        desc 'Add config file'
        default nil
      end

      option :methods do
        short '-m'
        long '--method'
        desc 'Add GET, POST, PUT, DELETE methods'
        default ['GET', 'POST', 'PUT', 'DELETE']
      end

      option :protocol do
        short '-pr'
        long '--protocol'
        desc 'Change current protocol'
        default 'http'
      end
        
      option :hostname do
        short '-h'
        long '--host'
        desc 'Change current hostname'
        default '0.0.0.0'
      end

      option :port do
        short '-p'
        long '--port'
        desc 'Change current port'
        default '4000'
      end      

      option :route do
        short '-r'
        long '--route'
        desc 'Change current route'
        default '/v1/routes'
      end  

      option :template do
        short '-t'
        long '--template'
        desc 'Add report template file'
        default template
      end 

      option :export do
        short '-e'
        long '--export'
        desc 'Export path'
        default './report.html'
      end
    end
        
    Choice.choices
  end

  
end
