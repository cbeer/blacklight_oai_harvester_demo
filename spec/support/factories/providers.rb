FactoryGirl.define do
  factory :provider do

  end

  factory :lc_oai_provider, :class => Provider do
    endpoint_url 'http://international.loc.gov:80/cgi-bin/oai2_0?verb=Identify'
  end
end
