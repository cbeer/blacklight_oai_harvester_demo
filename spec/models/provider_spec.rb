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

  describe "#metadata_prefix" do
    it "should use oai_dc by default" do
      provider.metadata_prefix = nil
      provider.metadata_prefix.should == 'oai_dc'
    end

  end
end
