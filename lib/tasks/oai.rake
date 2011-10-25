namespace :oai do
  desc "Harvest records from OAI providers"
  task :harvest => :environment do
    Provider.all.select { |x| Time.now > x.next_harvest_at }.each do |provider|
      print "Consuming #{provider.endpoint_url}: "
      count = provider.consume!

      print "#{count} records"
      print "\n"
    end
  end
end
