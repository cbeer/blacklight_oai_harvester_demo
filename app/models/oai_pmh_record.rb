module OaiPmhRecord
  extend ActiveSupport::Concern

  included do
    extend ClassAttributes
    include OM::XML::Document
    include Solrizer::XML::TerminologyBasedSolrizer
    include InstanceAttributes

    attr_accessor :provider

    set_terminology do |t|
      t.root(:path => 'record', :namespace_prefix => nil)

      t.header(:namespace_prefix => nil) do
        t.identifier :namespace_prefix => nil, :index_as => [:searchable, :displayable]
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

  module InstanceAttributes
    def to_solr
      solr_doc = super

      solr_doc['id'] = self.header.identifier.first.to_s.parameterize
      solr_doc['provider_id_i'] = self.provider.id if self.provider
      solr_doc['class_s'] = self.class.to_s

      solr_doc
    end
  end
end
