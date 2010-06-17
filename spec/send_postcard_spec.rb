require File.dirname(__FILE__) + '/spec_helper.rb'

describe "Send Postcard" do
  
  before :each do
    #Unique id - miliseconds
    @sample_image_name = "spec/doc/sample_image.jpg"
    @time_id = (Time.now.to_f * 1000).to_i
    @doc = open(File.dirname(__FILE__) + '/doc/sample.pdf')
    @client = PostalMethods::Client.new(PM_OPTS)
#puts (@client.public_methods - Object.public_methods).sort
    @sample_data = Base64.encode64(IO.read(@sample_image_name) )
    @upload_details = {
      :MyFileName => "sample_file.jpg",
      :FileBinaryData => @sample_data,
      :Permissions => "Account",
      :Description => "Sample File #{@time_id}",
      :Overwrite => true
    }
    @address_details = {
      :MyDescription=>"spec_test ---#{Time.now}---",
      :ImageSideFileType => "MyFile:sample_file.jpg",
      :AddressSideFileType => "MyFile:sample_file.jpg",
      :AttentionLine1 => " Attn line 1",
      :AttentionLine2 => " Attn line 2",
      :Company => " My Company",
      :Address1 => " 1 Main St.",
      :Address2 => " Suite 455, box 8",
      :City => "Superior",
      :State => "CO",
      :PostalCode => "80027",
      :Country => "USA"
    }
    #res = driver.sendPostcardAndAddress( details )
  end
  
  it "should instantiate and send a postcard" do
    @client.prepare!
    @client.send_postcard_and_address(@sample_image_name, @sample_image_name, @address_details, "the long goodbye").should > 0
  end

  it "should upload a file" do
    @client.prepare!
    @client.upload_file(@sample_image_name).should == "MyFile:#{File.basename(@sample_image_name)}"
  end
#  
#  it "should refuse to send letter before prepare" do
#    lambda {@client.send_letter(@doc, "the long goodbye")}.should raise_error(PostalMethods::NoPreparationException)
#  end  
#  
#  it "should raise the proper exception when trying to send textfile" do
#    @doc = open(File.dirname(__FILE__) + '/../README.txt')
#    @client.prepare!
#    lambda {@client.send_letter(@doc, "the long goodbye")}.should raise_error(PostalMethods::APIStatusCode3004Exception)
#  end
#  
#  it "should raise the proper exception when trying to send an empty string" do
#    @client.prepare!
#    lambda {@client.send_letter("", "the long goodbye")}.should raise_error(Errno::ENOENT)
#  end
  
  #it "should raise the proper exception when trying to send no description" do
  #  @client.prepare!
  #  lambda {@client.send_letter(@doc, nil)}.should raise_error(PostalMethods::APIStatusCode3004Exception)
  #end
end

describe "Send Postcard With Address" do
  
  before :each do
    @doc = open(File.dirname(__FILE__) + '/../spec/doc/sample.pdf')
    @addr = {:AttentionLine1 => "George Washington", :Address1 => "The White House", :Address2 => "1600 Pennsylvania Ave", 
      :City => "Washington", :State => "DC", :PostalCode => "20500", :Country => "USA"}
    @client = PostalMethods::Client.new(PM_OPTS)
  end
  
#  it "should instantiate and send a letter with address" do
#    @client.prepare!
#    rv = @client.send_letter_with_address(@doc, "Shark Jumping Notes", @addr).should > 0
#  end
#  
#  it "should raise the proper exception when trying to send letter without valid attention line" do
#    @client.prepare!
#    addr = @addr.except(:AttentionLine1)
#    lambda {@client.send_letter_with_address(@doc, "the long goodbye", addr)}.should raise_error(PostalMethods::APIStatusCode4008Exception)
#  end
#  
#  it "should refuse to send letter before prepare" do
#    lambda {@client.send_letter_with_address(@doc, "the long goodbye", @addr)}.should raise_error(PostalMethods::NoPreparationException)
#  end  
#  
#  it "should raise the proper exception when trying to send textfile" do
#    @doc = open(File.dirname(__FILE__) + '/../README.txt')
#    @client.prepare!
#    lambda {@client.send_letter_with_address(@doc, "the long goodbye", @addr)}.should raise_error(PostalMethods::APIStatusCode3004Exception)
#  end
#  
#  it "should raise the proper exception when trying to send an empty string" do
#    @client.prepare!
#    lambda {@client.send_letter_with_address("", "the long goodbye", @addr)}.should raise_error(Errno::ENOENT)
#  end
  
  
end
