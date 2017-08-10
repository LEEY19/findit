# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csv_text1 = File.read(Rails.root.join('lib', 'seeds', 'loop1doc1.csv'))
csv1 = CSV.parse(csv_text1, :headers => true, :encoding => 'ISO-8859-1')
csv1.each do |row|
  t = Video.new
  t.content_category = row['Content Category']
  t.title = row['Video Title']
  t.video_link = row['Video URL']
  t.picture = row['Video Cover Picture URL']
  t.duration = "5:00"
  t.save!
end

csv_text2 = File.read(Rails.root.join('lib', 'seeds', 'loop1doc2.csv'))
csv2 = CSV.parse(csv_text2, :headers => true, :encoding => 'ISO-8859-1')
csv2.each do |row|
  t = Product.new
  t.video_id = row['Video ID']
  t.title = row['Product Title']
  t.product_link = row['Product Link']
  t.picture = row['Product Picture URL']
  t.save!
end