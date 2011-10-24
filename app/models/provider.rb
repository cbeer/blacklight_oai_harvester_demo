class Provider < ActiveRecord::Base
  has_many :records

  validates :endpoint_url, :presence => true, :format => { :with => /^https?/, :message => "must be an http/https url"}
end
