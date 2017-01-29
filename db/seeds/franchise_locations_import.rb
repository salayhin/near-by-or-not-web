require 'csv'


franchise_files = ['franchise_locations.csv']


franchise_files.each do |fr|
  csv_text = File.read(Rails.root.join('lib', 'seeds', fr))
  csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

  csv.each do |row|
    franchise_location = FranchiseLocation.new
    franchise_location.factual_id = row['factual_id']
    franchise_location.franchise_id = Franchise.find_franchise(row['name'])
    franchise_location.name = row['name']
    franchise_location.address = row['address']
    franchise_location.locality = row['locality']
    franchise_location.region = row['region']
    franchise_location.post_code = row['post_code']
    franchise_location.country = row['country']
    franchise_location.telephone = row['telephone']
    franchise_location.website = row['website']
    franchise_location.latitude = row['latitude']
    franchise_location.longitude = row['longitude']
    #franchise_location.hours_of_operations = row['hours_of_operations']
    franchise_location.category_labels = row['category_labels']
    #franchise_location.chain_name = row['chain_name']
    franchise_location.save

    puts "#{franchise_location.latitude}, #{franchise_location.longitude} saved"
  end
end


