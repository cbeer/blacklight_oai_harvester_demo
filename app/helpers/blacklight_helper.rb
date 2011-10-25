module BlacklightHelper
  include Blacklight::BlacklightHelperBehavior

  def application_name
    'Blacklight OAI Harvester Demo'
  end

  def render_index_field_value args
    return render_provider_field_value(args) if args[:field] == 'provider_id_i'
    super
  end

  def render_document_show_field_value args
    return render_provider_field_value(args) if args[:field] == 'provider_id_i'
    super
  end

  def render_provider_field_value args
    value = args[:value]
    value ||= args[:document].get(args[:field], :sep => nil) if args[:document] and args[:field]
    provider = Provider.find(value)
    link_to provider.name, provider
  end
end
