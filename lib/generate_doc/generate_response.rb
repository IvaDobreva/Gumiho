require 'nokogiri'
require 'erb'

module GenerateDoc

  def generate_response(response, template_file)

    template = File.open(template_file, 'r').read
    erb = ERB.new(template)
    File.open("report.html", 'w+') { 
      |file| file.write(erb.result(binding)) 
    }

  end

end
