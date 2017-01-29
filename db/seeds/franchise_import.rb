require 'csv'


franchise_files = ['top_franchises.csv']


franchise_files.each do |fr|
  csv_text = File.read(Rails.root.join('lib', 'seeds', fr))
  csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

  csv.each do |row|
    franchise = Franchise.new
    franchise.name = row['name']
    franchise.rank = row['rank']
    franchise.is_client = (row['is_client'] == 'Yes' ? true : false)
    franchise.website = row['website']
    franchise.save

    puts "#{franchise.name}, #{franchise.rank} saved"
  end
end

