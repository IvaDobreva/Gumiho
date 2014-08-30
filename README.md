# Gumiho

 Easily create RESTful API documentation

##Table of contents
- [Installation] (#instalattion)
- [Usage](#usage)
	- [Settings](#settings)	
	- [Example for YAML set up] (#example-for-yaml-set-up)
	- [Generate documentation] (#generate-documentation)	
- [The tricky part](#the-tricky-part)
	- [Your API] (#your-api)
	
## Installation
```
$ gem install gumiho
```
## Usage

After installing gumiho you need to have running API and set up gumiho.

##Settings

Gumiho has default setting as follows:
```
	- config - Do the set up with single YAML file 
		long: --config [some/path]
		short: -c	[some/path]
		default: nil

	- methods - Choose which route methods you want
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
```
## Example for YAML set up
```
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
	 15   '/some/dir/where/thetemplateis/template.html.erb'
```
##Generate Documentation
To generate your API documentation you need to type `gumiho-export` with your desired options.
After that you need to wait for the gem to finish it's work. 
The final result you can see in your export dir, with the default template it will look like this:
![Alt text](https://github.com/IvaDobreva/Gumiho/blob/master/demo.png "Demo page")

##The tricky part
###Your API
To make Gumiho work properly, you need to do some changes in your API.
* Gumiho needs information about all the routes you're trying to document.
So you'll need a Get request wich returns hash containing all routes and information about them.
Here is example how it looks like:
```
[
    {
        "method": "GET",
        "path": "/v1/routes"
    },
    {
        "method": "GET",
        "path": "/v1/route1/:id"
    },
    {
        "method": "POST",
        "path": "/v1/route1"
    },
    {
        "method": "PUT",
        "path": "/v1/route1/:id"
    },
    {
        "method": "DELETE",
        "path": "/v1/route1/:id"
    }
]
```

* Then you need to get information about every single route. This will be done with the help of the `doc` parameter.
This is boolean param and when its value is `true` your API must return information about the route.
Here is how the response of your API must look like:
```
 {
        metadata: {
          method: route.route_method,
          status: 'ok',
          params: params
        },
        data: {
          description: route.route_description,
          params: route.route_params.map do |key, info|
            info.merge(:name => key)
          end
        },
        errors: []
   }
```
