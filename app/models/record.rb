class Record < ActiveRecord::Base
  belongs_to :provider

  serialize :content, OaiDcDocument::Serializer.new
  after_save :update_index

  def content= text
    self[:content] = OaiDcDocument::Serializer.new.load(text)
  end

  def title
    content.title.first.to_s
  end

  def description
    content.description.first.to_s
  end

  def to_solr
    solr_doc = content.to_solr

    solr_doc[:id] = self.content.record_identifier.first.parameterize
    solr_doc[:provider_id_i] = self.provider_id

    solr_doc
  end

  def update_index
    Blacklight.solr.add self.to_solr, :add_attributes => {:commitWithin => 50}
  end
end
