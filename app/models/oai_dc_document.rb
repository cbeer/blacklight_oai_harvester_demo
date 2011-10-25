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
    t.title(:proxy => [:metadata, :dc, :title])
    t.description(:proxy => [:metadata, :dc, :description])
  end

  def self.set_oai_metadata_terminology t
    t.namespaces['oai_dc'] = 'http://www.openarchives.org/OAI/2.0/oai_dc/'
    t.namespaces['dc'] =  "http://purl.org/dc/elements/1.1/" 
    t.dc :namespace_prefix => 'oai_dc' do
      t.identifier :namespace_prefix => 'dc'
      t.title :namespace_prefix => 'dc'
      t.description :namespace_prefix => 'dc'
      t.creator :namespace_prefix => 'dc'
      t.contributor :namespace_prefix => 'dc'
      t.publisher :namespace_prefix => 'dc'
      t.subject :namespace_prefix => 'dc'
      t.date :namespace_prefix => 'dc'
      t.language :namespace_prefix => 'dc'
      t.coverage :namespace_prefix => 'dc'
      t.format :namespace_prefix => 'dc'
      t.relation :namespace_prefix => 'dc'
      t.rights :namespace_prefix => 'dc'
      t.source :namespace_prefix => 'dc'
      t.type :namespace_prefix => 'dc'
    end
  end

  include OaiPmhRecord
end
