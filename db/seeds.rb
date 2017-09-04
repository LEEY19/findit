# coding: utf-8

require 'csv'

csv_text1 = File.read(Rails.root.join('lib', 'seeds', 'loop3doc1.csv'))
csv1 = CSV.parse(csv_text1, :headers => true, :encoding => 'ISO-8859-1')
csv1.each do |row|
  t = Video.new
  t.content_category = row['Content Category']
  t.title = row['Video Title']
  t.video_link = row['Video URL']
  t.picture = row['Video Cover Picture URL']
  t.duration = row['Duration']
  t.save!
end

csv_text2 = File.read(Rails.root.join('lib', 'seeds', 'loop3doc2.csv'))
csv2 = CSV.parse(csv_text2, :headers => true, :encoding => 'ISO-8859-1')
csv2.each do |row|
  t = Product.new
  t.video_id = row['Video ID']
  t.title = row['Product Title']
  t.product_link = row['Product Link']
  t.picture = row['Product Picture URL']
  t.appeared_at = row['Time Stamp']
  t.product_category = row['Product Category']
  t.save!
end