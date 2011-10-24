require 'spec_helper'

describe Provider do
  let(:provider) { Factory(:lc_oai_provider) }

  it "is valid" do
    provider.should be_valid
  end

  describe "#endpoint_url" do
    it "is required" do
      provider.endpoint_url = nil
      provider.should_not be_valid
    end

    it "should look like a url" do
      provider.endpoint_url = 'urn:1234'
      provider.should_not be_valid
    end
  end

  describe "#client" do
    it "should provide an oai client for the endpoint" do
      provider.client.should be_a_kind_of(OAI::Client)
    end
  end

  describe "oai_client_options" do
    it "should contain the default options for the harvest" do
      options = provider.send(:oai_client_options)
      options.keys.should include(:metadata_prefix)
    end

    it "should include the set, if a set is given" do
      provider.set = 'asdfg'
      options = provider.send(:oai_client_options)
      options.keys.should include(:metadata_prefix, :set)
    end
  end

  describe "#each_record" do
    it "should iterate through every record" do
      count = 0

      provider.each_record(:limit => 10) do |record| 
        count += 1
      end

      count.should == 10
    end

    it "should not raise an error if no records are returned" do
       count = 0
       provider.set = 'asdf'
       provider.each_record(:limit => 10) { |record| count += 1 }
       count.should == 0
    end
  end

  describe "#consume!" do
    it "should ingest the feed's records" do
      provider.should_receive(:process_record).exactly(10).times
      provider.consume! :limit => 10
    end
  end

  describe "#metadata_prefix" do
    it "should use oai_dc by default" do
      provider.metadata_prefix = nil
      provider.metadata_prefix.should == 'oai_dc'
    end
  end
end
