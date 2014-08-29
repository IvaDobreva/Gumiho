# Gumiho

 Easily create RESTful API documentation

##Table of contents
- [Installation] (#instalattion)
- [Usage](#usage)
	- [Settings](#settings)	
	- [Example for YAML set up] (#example-for-yaml-set-up)
		
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

	-	methods - Choose which route methods you want
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
