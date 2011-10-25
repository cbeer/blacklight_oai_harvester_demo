class Record < ActiveRecord::Base
  belongs_to :provider

  serialize :content, OaiDcDocument::Serializer.new

  def title
    content.title.first.to_s
  end

  def description
    content.description.first.to_s
  end
end
