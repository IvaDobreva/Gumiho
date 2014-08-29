# Gumiho

 Easily create RESTful API documentation

##Table of contents
- [Installation] (#instalattion)
- [Usage](#usage)
	- [Settings](#settings)	
	- [Example for YAML set up] (#example-for-yaml-set-up)
	- [Generate documentation] (#generate-documentation)	
- [The tricky part](#the-tricky-part)
	
## Installation

$ gem install gumiho

## Usage

After installing gumiho you need to have running API and set up gumiho.

##Settings

Gumiho has default setting as follows:

	- config - Do the set up with single YAML file 
		long: --config [some/path]
		short: -c	[some/path]
		default: nil

	-methods - Choose which route methods you want
		long: --methods 
		short: -m	
		default: [GET, POST, PUT, DELTE]

	- protocol - Set up the protocol you are using
		long: --protocol 
		short: --pr
		default: 'http'

	- hostname - Set up your host
		long: --host
		short: -h
		default: '0.0.0.0'

	- port - Set up your port
		long: --port
		short: -p
		default: '4000'

	- route - Set up path for your routes
		long: --route
		short: -r
		default: '/v1/routes'

	- template - Add path to the template you ate using
		long: --template
		short: -t
		default: '/lib/gumiho/template/template.html.erb'

	- export - Set up export directory
		long: --export
		short: - e
		default: 'Your/current/dir/report.html' 

## Example for YAML set up

	  1##protocol 
	  2 generate_strategy: 'http'
	  3 
	  4 ##methods
	  5 methods: [ 'GET', 'POST', 'DELETE', 'PUT' ]
	  6 
	  7 ##domain settings
	  8 http:
	  9   hostname: '0.0.0.0'
	 10   port: '4000'
	 11   path: '/v1/routes'
	 12 
	 13 ##template file
	 14 template:
	 15   '/home/iva/GEM/lib/gumiho/template.html.erb'

##Generate Documentation
To generate your API documentation you need to type 'gumiho-export' with your desired options.
After that you need to wait for the gem to finish it's work. 
The final result you can see in your export dir, with the default template it will look like this

##The tricky part
