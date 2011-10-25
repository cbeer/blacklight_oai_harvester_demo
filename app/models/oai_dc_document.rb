class OaiDcDocument 

  class Serializer
    def load(text)
      return unless text
      OaiDcDocument.from_xml(text)
    end

    def dump(obj)
      return obj.to_xml if obj.respond_to?(:to_xml)
      obj
    end
  end

  def self.add_oai_metadata_terminology_proxies t
    t.identifier(:proxy => [:metadata, :dc, :identifier])
    t.title(:proxy => [:metadata, :dc, :title])
    t.description(:proxy => [:metadata, :dc, :description])
    t.subject(:proxy => [:metadata, :dc, :subject])
    t.coverage(:proxy => [:metadata, :dc, :coverage])
    t.creator(:proxy => [:metadata, :dc, :creator])
    t.publisher(:proxy => [:metadata, :dc, :publisher])
    t.contributor(:proxy => [:metadata, :dc, :contributor])
    t.language(:proxy => [:metadata, :dc, :language])
    t.format(:proxy => [:metadata, :dc, :format])
    t.type(:proxy => [:metadata, :dc, :type])
  end

  def self.set_oai_metadata_terminology t
    t.namespaces['oai_dc'] = 'http://www.openarchives.org/OAI/2.0/oai_dc/'
    t.namespaces['dc'] =  "http://purl.org/dc/elements/1.1/" 
    t.dc :namespace_prefix => 'oai_dc' do
      t.identifier :namespace_prefix => 'dc', :index_as => [:displayable, :sortable]
      t.title :namespace_prefix => 'dc', :index_as => [:searchable, :displayable, :sortable]
      t.description :namespace_prefix => 'dc',  :index_as => [:searchable, :displayable] 
      t.creator :namespace_prefix => 'dc', :index_as => [:displayable, :facetable]
      t.contributor :namespace_prefix => 'dc', :index_as => [:displayable, :facetable]
      t.publisher :namespace_prefix => 'dc', :index_as => [:displayable, :facetable]
      t.subject :namespace_prefix => 'dc', :index_as => [:facetable]
      t.date :namespace_prefix => 'dc'
      t.language :namespace_prefix => 'dc', :index_as => [:facetable]
      t.coverage :namespace_prefix => 'dc', :index_as => [:facetable]
      t.format :namespace_prefix => 'dc', :index_as => [:facetable]
      t.relation :namespace_prefix => 'dc'
      t.rights :namespace_prefix => 'dc'
      t.source :namespace_prefix => 'dc'
      t.type :namespace_prefix => 'dc', :index_as => [:facetable]
    end
  end

  include OaiPmhRecord

  def update_index
    Blacklight.solr.add self.to_solr, :add_attributes => {:commitWithin => 50}
  end
end
