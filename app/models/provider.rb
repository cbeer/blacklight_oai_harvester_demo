class Provider < ActiveRecord::Base
  has_many :records

  validates :endpoint_url, :presence => true, :format => { :with => /^https?/, :message => "must be an http/https url"}

  before_save do
    self.name = nil if self.name.blank?
    self.set = nil if self.set.blank?
    self.metadata_prefix = nil if self.metadata_prefix.blank?
  end

  def client
    OAI::Client.new(self.endpoint_url, :parser => 'libxml')
  end

  def each_record(options = {}, &block)
    response = nil
    count = 0

    begin
      local_options = {}
      local_options[:resumption_token] = response.resumption_token if response and response.resumption_token and not response.resumption_token.empty?
      local_options = oai_client_options if local_options.empty?

      response = client.list_records(local_options)

      response.doc.find("/OAI-PMH/ListRecords/record").each do |record|
        count += 1 

        yield record

        break if options[:limit] and count >= options[:limit]
      end
      

    rescue
      raise unless $!.respond_to?(:code) and $!.try(:code) ==  "noRecordsMatch"
    end while (options[:limit].blank? or count < options[:limit]) and not response.try(:resumption_token).blank?
  end

  def consume!(options = {})
    count = 0

    each_record(options) do |xml|
      process_record(xml)
      count += 1
    end

    self.consumed_at = Time.now
    save

    count
  end

  def metadata_prefix
    read_attribute(:metadata_prefix) || 'oai_dc'
  end

  def next_harvest_at
    consumed_at + interval
  end

  def consumed_at
    read_attribute(:consumed_at) || Time.at(1)
  end

  def interval
    (read_attribute(:interval) || 1.day).seconds
  end

  protected
  def oai_client_options
    options = {}
    options[:set] = set unless set.blank?
    options[:from] = consumed_at.utc.xmlschema unless consumed_at.blank?
    options[:metadata_prefix] = metadata_prefix

    options
  end

  def process_record xml
    Record.create :content => xml.to_s, :provider => self
  end

end
