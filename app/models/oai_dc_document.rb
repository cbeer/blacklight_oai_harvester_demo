class OaiDcDocument 

  class Serializer
    def load(text)
      return unless text
      OaiDcDocument.from_xml(text)
    end

    def dump(obj)
      obj.to_xml
    end
  end

  include OM::XML::Document
  set_terminology do |t|
    t.namespaces['oai_dc'] = 'http://www.openarchives.org/OAI/2.0/oai_dc/'
    t.namespaces['dc'] =  "http://purl.org/dc/elements/1.1/" 

    t.root(:path => 'record', :namespace_prefix => nil)

    t.header(:namespace_prefix => nil) do
      t.identifier :namespace_prefix => nil
      t.datestamp :namespace_prefix => nil
      t.setSpec :namespace_prefix => nil
    end

    t.metadata(:namespace_prefix => nil) do
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

    t.title(:proxy => [:metadata, :dc, :title])
    t.description(:proxy => [:metadata, :dc, :description])
  end
end
