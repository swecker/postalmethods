= postalmethods

* Info: http://www.postalmethods.com/resources/quickstart
* Code: http://github.com/JoeAtBodkinConsulting/postalmethods

== DESCRIPTION:

API wrapper library for the postal methods api.

== FEATURES/PROBLEMS:

* Provides access to all of the API methods with appropriate 
  exceptions as necessary.

== SYNOPSIS:

require 'postalmethods'

@doc = open(File.dirname(__FILE__) + '/../spec/doc/sample.pdf')
@client = PostalMethods::Client.new(:api_key=>"your-key-here")
rv = @client.send_letter(@doc, "description of doc")
puts rv

== REQUIREMENTS:

* This gem relies on the soap4r gem.

== INSTALL:

* sudo gem install postalmethods
* get a developer account at postalmethods.com
* generate an api key
* to run the tests, put your key in spec/spec_helper.rb on the line for PM_OPTS

== LICENSE:

* See License.txt
