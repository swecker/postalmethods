require File.dirname(__FILE__) + '/spec_helper.rb'

describe "Send Postcard" do
  
  before :each do
    #Unique id - miliseconds
    @time_id = (Time.now.to_f * 1000).to_i

    @sample_image_name = "spec/doc/sample_image.jpg"
    @doc = open(File.dirname(__FILE__) + '/doc/sample.pdf')
    @client = PostalMethods::Client.new(PM_OPTS)

    @address_details = {
      :MyDescription=>"spec_test ---#{Time.now}---",
      :AttentionLine1 => "The White House",
      :Address1 => "1600 Pennsylvania Avenue NW",
      :City => "Washington",
      :State => "DC",
      :PostalCode => "20500",
      :Country => "USA"
    }

  end
  
  it "should upload a file" do
    @client.prepare!
    @client.upload_file(@sample_image_name).should == "MyFile:#{File.basename(@sample_image_name)}"
  end

  it "should upload a file from local binary data" do
    @client.prepare!
    @sample_data = open(@sample_image_name, "rb") {|io| io.read } 
    @upload_details = {
      :MyFileName => "sample_image_file.jpg",
      :FileBinaryData => @sample_data,
      :Permissions => "Account",
      :Description => "Sample File #{@time_id}",
      :Overwrite => true
    }
    filename = @client.upload_file(@upload_details)
    filename.should == "MyFile:sample_image_file.jpg"
  end

  it "should upload a file from local binary data THEN send a postcard" do
    @client.prepare!
    @sample_data = IO.read(@sample_image_name)
    @upload_details = {
      :MyFileName => "sample_image_file.jpg",
      :FileBinaryData => @sample_data,
      :Permissions => "Account",
      :Description => "Sample File #{@time_id}",
      :Overwrite => true
    }
    filename = @client.upload_file(@upload_details)
    filename.should == "MyFile:sample_image_file.jpg"
    @client.send_postcard_and_address(filename, filename, @address_details).should > 0
  end

  it "should instantiate and send a postcard" do
    @client.prepare!
    @client.send_postcard_and_address(@sample_image_name, @sample_image_name, @address_details, "Sample Postcard at #{Time.now()}").should > 0
  end

  it "should upload a file THEN send a postcard" do
    @client.prepare!
    filename = @client.upload_file(@sample_image_name)
    filename.should == "MyFile:#{File.basename(@sample_image_name)}"
    @client.send_postcard_and_address(filename, filename, @address_details).should > 0
  end
  
  it "should refuse to send a postcard before prepare" do
    lambda {@client.send_letter(@doc, "the long goodbye")}.should raise_error(PostalMethods::NoPreparationException)
  end  
  
  it "should raise the proper exception when trying to send a missing file" do
    @client.prepare!
    lambda {@client.send_postcard_and_address("missing.jpg", "missing.jpg", @address_details)}.should raise_error(Errno::ENOENT)
  end
  
end

describe "Send Postcard With Address" do
  
  before :each do
    @doc = open(File.dirname(__FILE__) + '/../spec/doc/sample.pdf')
    @addr = {:AttentionLine1 => "George Washington", :Address1 => "The White House", :Address2 => "1600 Pennsylvania Ave", 
      :City => "Washington", :State => "DC", :PostalCode => "20500", :Country => "USA"}
    @client = PostalMethods::Client.new(PM_OPTS)
  end
  
end
