require 'csv'


franchise_files = ['dunkins_donuts.csv', 'jimmy_johns_gourmet_sandwiches.csv', 'mc_donalds.csv',
                    'seven_eleven.csv', 'the_ups_stores.csv']


franchise_files.each do |fr|
  csv_text = File.read(Rails.root.join('lib', 'seeds', fr))
  csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

  csv.each do |row|
    city = Franchise.new
    city.factual_id = row['factual_id']
    city.name = row['name']
    city.address = row['address']
    city.locality = row['locality']
    city.region = row['region']
    city.post_code = row['post_code']
    city.country = row['country']
    city.telephone = row['telephone']
    city.website = row['website']
    city.latitude = row['latitude']
    city.longitude = row['longitude']
    city.hours_of_operations = row['hours_of_operations']
    city.category_labels = row['category_labels']
    city.chain_name = row['chain_name']
    city.save

    puts "#{city.latitude}, #{city.longitude} saved"
  end
end

