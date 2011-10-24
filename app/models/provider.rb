class Provider < ActiveRecord::Base
  has_many :records

  validates :endpoint_url, :presence => true, :format => { :with => /^https?/, :message => "must be an http/https url"}

  def metadata_prefix
    read_attribute(:metadata_prefix) || 'oai_dc'
  end

end
