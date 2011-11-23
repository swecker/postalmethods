module PostalMethods
  
  module SendLetter
    
    def send_letter(doc, description, work_mode = "")
      raise PostalMethods::NoPreparationException unless self.prepared 
      ## push a letter over the api
      
      self.document = doc
      rv = @rpc_driver.sendLetter(:APIKey => self.api_key, :FileExtension => self.document[:extension], 
                                  :FileBinaryData => self.document[:bytes], :MyDescription => description, :WorkMode => self.work_mode)
      
      status_code = rv.sendLetterResult.to_i
      
      if status_code > 0
        return status_code
      elsif API_STATUS_CODES.has_key?(status_code)
        instance_eval("raise APIStatusCode#{status_code.to_s.gsub(/( |\-)/,'')}Exception")
      end
    end
    
    def send_letter_explicitly(opts)
      raise PostalMethods::NoPreparationException unless self.prepared 
      raise PostalMethods::OptionsNotHashException unless (opts.class == Hash)
      
      rv = @rpc_driver.sendLetter({:APIKey => self.api_key, :WorkMode => self.work_mode}.merge!(opts))
      
      status_code = rv.sendLetterResult.to_i
      
      if status_code > 0
        return status_code
      elsif API_STATUS_CODES.has_key?(status_code)
        instance_eval("raise APIStatusCode#{status_code.to_s.gsub(/( |\-)/,'')}Exception")
      end
    end
    
    def send_letter_with_address(doc, description, address)
      raise PostalMethods::NoPreparationException unless self.prepared 
      raise PostalMethods::AddressNotHashException unless (address.class == Hash)
      
      ## setup the document
      self.document = doc

      opts = {:APIKey=>self.api_key, :FileExtension => self.document[:extension], 
                                  :FileBinaryData => self.document[:bytes], :MyDescription => description, :WorkMode => self.work_mode}
                                  
      opts.merge!(address)

      ## push a letter over the api
      rv = @rpc_driver.sendLetterAndAddress(opts)
      status_code = rv.sendLetterAndAddressResult.to_i
      
      if status_code > 0
        return status_code
      elsif API_STATUS_CODES.has_key?(status_code)
        instance_eval("raise APIStatusCode#{status_code.to_s.gsub(/( |\-)/,'')}Exception")
      end
    end

  end
  
end
