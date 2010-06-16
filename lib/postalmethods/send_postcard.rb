module PostalMethods
  
  module SendPostcard
    
    def send_postcard_and_address(image_side_filename, address_side_filename, address, description="", work_mode = "Default")
      raise PostalMethods::NoPreparationException unless self.prepared 
      #raise PostalMethods::AddressNotHashException unless (address.class == Hash)

      #self.document = doc
      is_name = upload_file(image_side_filename)
      as_name = upload_file(address_side_filename)

      ## push a postcard over the api
      opts = {:APIKey=> self.api_key,
        :MyDescription => description,
        :WorkMode => self.work_mode,
        :ImageSideScaling => self.imageSideScaling,
        :ImageSideFileType => is_name,
        :AddressSideFileType => as_name,
        :PrintColor=>self.printColor,
        :PostcardSize=>self.postcardSize,
        :MailingPriority=>self.mailingPriority
      }

      #:AttentionLine1 => " Attn line 1",
      #:AttentionLine2 => " Attn line 2",
      #:Company => " My Company",
      #:Address1 => " 1261 S Idalia Ct",
      #:Address2 => " Suite 455, box 8",
      #:City => "Superior",
      #:State => "CO",
      #:PostalCode => "80027",
      #:Country => "USA"

      
      opts.merge!(address)
      rv = @rpc_driver.sendPostcardAndAddress(opts)
      
      #Handle the return value
      status_code = rv.sendPostcardAndAddressResult.to_i
     
      if status_code > 0
        return status_code
      elsif API_STATUS_CODES.has_key?(status_code)
        instance_eval("raise APIStatusCode#{status_code.to_s.gsub(/( |\-)/,'')}Exception")
      end
    end
    
    def upload_file(doc_name, description="", overwrite=true, work_mode="") 
      file_name=File.basename(doc_name)
      file_data = Base64.encode64(IO.read(doc_name) )
      opts = {
         :APIKey => self.api_key,
	 :MyFileName => file_name,
	 :FileBinaryData => file_data,
	 :Permissions => self.permissions,
	 :Description => description,
	 :Overwrite => overwrite
      }

      status_code = self.rpc_driver.uploadFile(opts).uploadFileResult

      if status_code == "-3000"
        return "MyFile:#{file_name}"
      elsif API_STATUS_CODES.has_key?(status_code)
        instance_eval("raise APIStatusCode#{status_code.to_s.gsub(/( |\-)/,'')}Exception")
      end
    end

  end
  
end
