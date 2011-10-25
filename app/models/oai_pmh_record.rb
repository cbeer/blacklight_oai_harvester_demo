module OaiPmhRecord
  extend ActiveSupport::Concern

  included do
    extend ClassAttributes
    include OM::XML::Document
    include Solrizer::XML::TerminologyBasedSolrizer
    set_terminology do |t|
      t.root(:path => 'record', :namespace_prefix => nil)

      t.header(:namespace_prefix => nil) do
        t.identifier :namespace_prefix => nil
        t.datestamp :namespace_prefix => nil
        t.setSpec :namespace_prefix => nil
      end

      t.metadata(:namespace_prefix => nil) do
        set_oai_metadata_terminology(t)
      end

      add_oai_metadata_terminology_proxies(t)
    end
  end

  module ClassAttributes
    def set_oai_metadata_terminology terminology

    end

    def add_oai_metadata_terminology_proxies terminology

    end
  end
end
