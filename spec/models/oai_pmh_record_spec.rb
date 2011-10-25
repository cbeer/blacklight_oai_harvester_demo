require 'spec_helper'

describe OaiPmhRecord do
  class MockOaiPmhMetadataDocument
    def self.set_oai_metadata_terminology t
      t.metadata_term  :namespace_prefix => nil
    end

    def self.add_oai_metadata_terminology_proxies t
      t.proxy_term :proxy => [:metadata, :metadata_term]
    end
    include OaiPmhRecord
  end

  describe "#terminology" do
    it "should include metadata terminologies" do

      MockOaiPmhMetadataDocument.terminology.xpath_for(:metadata, :metadata_term).should == "//metadata/metadata_term"
    end
    it "should include metadata proxies" do
      MockOaiPmhMetadataDocument.terminology.xpath_for(:proxy_term).should == "//metadata/metadata_term"
    end
  end

  describe "#to_solr" do
    subject { MockOaiPmhMetadataDocument.from_xml '<record><header><identifier>123</identifier></header></record>' }

    it "should include a derived natural identifier" do
      subject.to_solr['id'].should == '123'
    end

    it "should include the provider, if available" do
      subject.provider = OpenStruct.new :id => 1
      subject.to_solr['provider_id_i'].should == 1
    end

    it "should include the name of the generating class" do
      subject.to_solr['class_s'].should == 'MockOaiPmhMetadataDocument'
    end
  end
end
