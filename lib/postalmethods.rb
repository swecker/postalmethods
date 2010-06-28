$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module PostalMethods
  VERSION = '1.1.2'
  
  class Client

      require 'rubygems'
      gem 'soap4r'
      require 'soap/rpc/driver'
      require 'soap/wsdlDriver'
      #require 'ruby-debug'

      VERBOSE=nil # soap4r is a noisy bugger
      
      require 'postalmethods/exceptions.rb'
      require 'postalmethods/document_processor.rb'
      require 'postalmethods/send_letter.rb'
      require 'postalmethods/send_postcard.rb'
      require 'postalmethods/get_letter_status.rb'
      require 'postalmethods/utility.rb'

      # include modules
      include SendLetter
      include SendPostcard
      include DocumentProcessor
      include GetLetterStatus
      include UtilityMethods
    
      attr_accessor :api_uri, :api_key, :to_send, :rpc_driver, :prepared, :work_mode, :valid_work_modes, :imageSideScaling, :printColor, :postcardSize, :mailingPriority, :permissions, :username, :password
  
      def initialize(opts = {})
        if opts[:api_key].nil?
          raise PostalMethods::NoCredentialsException
        end
        
        self.valid_work_modes = {:default => "Default", :production => "Production", :development => "Development"}
        
        ## declare here so we can override in tests, etc.
        self.api_uri = "https://api.postalmethods.com/2009-09-09/PostalWS.asmx?WSDL"
                
        self.api_key = opts[:api_key] || nil
        
        self.work_mode = (opts[:work_mode].nil? ? "default" : opts[:work_mode])

        self.imageSideScaling = opts[:imageSideScaling ] || "Default"
	self.printColor = opts[:printColor ] || "Default"
	self.postcardSize = opts[:postcardSize ] || "Default"
	self.mailingPriority = opts[:mailingPriority ] || "Default"
	self.permissions = opts[:permissions ] || "User"

      end

      def prepare!
        begin
          self.rpc_driver = SOAP::WSDLDriverFactory.new(self.api_uri).create_rpc_driver
        rescue SocketError, RuntimeError
          raise PostalMethods::NoConnectionError
        end
        self.prepared = true
        return self
      end
      
      def work_mode=(in_mode="default")
        mode = in_mode.to_s.downcase.to_sym
        
        if self.valid_work_modes[mode].nil?
          @work_mode = :default
        else
          @work_mode = mode
        end
      end
      
      def work_mode
        return self.valid_work_modes[@work_mode]
      end
      
  end
end
