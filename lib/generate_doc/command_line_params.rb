require 'choice'

module GenerateDoc

  def get_cl_params
    
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

      option :ssl do
        short '-s'
        long '--ssl'
        desc 'enable/disable ssl use'
        default "false"
      end

      option :template do
        short '-t'
        long '--template'
        desc 'Add report template file'
        default '/home/iva/GEM/lib/generate_doc/template.html.erb'
      end 

    end
        
    Choice.choices
  end

  
end
