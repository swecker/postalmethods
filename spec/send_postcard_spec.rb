require File.dirname(__FILE__) + '/spec_helper.rb'

describe "Send Postcard" do
  
  before :each do
    #Unique id - miliseconds
    @time_id = (Time.now.to_f * 1000).to_i

    @sample_image_name = "spec/doc/sample_image.jpg"
    @doc = open(File.dirname(__FILE__) + '/doc/sample.pdf', 'rb'){|io| io.read}
    @client = PostalMethods::Client.new(PM_OPTS)

    @address_details = {
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

  it "should upload a template" do
    @addr_template_filename = File.dirname(__FILE__) + '/../spec/doc/postcard_address_side_with_return_address.html'
    @addr_template = open(@addr_template_filename, 'rb'){|io| io.read }
    @client.prepare!
    @client.upload_file(@addr_template_filename).should == "MyFile:#{File.basename(@addr_template_filename)}"
  end
  
  it "should send a postcard with two templates" do
    @img_template_filename = File.dirname(__FILE__) + '/../spec/doc/postcard_image_side_with_return_address.html'
    @img_template = open(@img_template_filename, 'rb'){|io| io.read }
    @addr_template_filename = File.dirname(__FILE__) + '/../spec/doc/postcard_address_side_with_return_address.html'
    @addr_template = open(@addr_template_filename, 'rb'){|io| io.read }
    opts={}

    #Prepare address side
    opts[:AddressSideFileType]="HTML"
    opts[:MyDescription]="Sending Two Template Postcard #{Time.now}"
    opts[:AddressSideBinaryData]=@addr_template

    #Prepare image side
    opts[:ImageSideFileType]="HTML"
    opts[:ImageSideBinaryData]=@img_template

    opts.merge!@address_details
    @client.prepare!
    @client.send_postcard_and_address_advanced(opts).should > 0
  end

  it "should send a postcard with an image and template" do
    @addr_template_filename = File.dirname(__FILE__) + '/../spec/doc/postcard_address_side_with_return_address.html'
    @addr_template = open(@addr_template_filename, 'rb'){|io| io.read }
    opts={}

    #Prepare address side
    opts[:AddressSideFileType]="HTML"
    opts[:MyDescription]="Sending Template Postcard #{Time.now}"
    opts[:AddressSideBinaryData]=@addr_template

    #Prepare image side
    opts[:ImageSideFileType]="jpg"
    opts[:ImageSideBinaryData]=open(@sample_image_name){|io| io.read}

    opts.merge!@address_details
    @client.prepare!
    @client.send_postcard_and_address_advanced(opts).should > 0
  end

end
