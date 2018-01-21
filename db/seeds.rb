# coding: utf-8

require 'csv'

csv_text1 = File.read(Rails.root.join('lib', 'seeds', 'videoss.csv'))
csv1 = CSV.parse(csv_text1, :headers => true, :encoding => 'ISO-8859-1')
csv1.each do |row|
  t = Video.new
  t.content_category = row["Content Genre"]
  t.title = row['Video Title']
  t.video_link = row['Video URL']
  t.picture = row['Video Cover Picture URL']
  t.duration = row['Duration']
  t.save!
end

csv_text2 = File.read(Rails.root.join('lib', 'seeds', 'productss.csv'))
csv2 = CSV.parse(csv_text2, :headers => true, :encoding => 'ISO-8859-1')
csv2.each do |row|
  t = Product.new
  t.video_id = row["Video ID"]
  t.title = row['Product Title']
  t.colors = row['Product Colors']
  t.sizes = row['Product Sizes']
  t.product_link = row['Product Link']
  t.picture = row['Product Picture URL']
  t.screenshot = row['Screenshot URL']
  t.appeared_at = row['Time Stamp']
  t.match_type = row['Match Type']
  t.save!
end

# csv_text3 = File.read(Rails.root.join('lib', 'seeds', 'loop5doc3.csv'))
# csv3 = CSV.parse(csv_text3, :headers => true, :encoding => 'ISO-8859-1')
# csv3.each do |row|
#   t = RelatedVideo.new
#   t.video_id = row['Video ID']
#   t.title = row['Video Title']
#   t.video_link = row['Video URL']
#   t.picture = row['Video Cover Picture URL']
#   t.duration = row['Duration']
#   t.save!
# end
Episode.create(name: "Red Velvet Ep.13")
Episode.create(name: "Red Velvet Ep.14")
scenes13 = File.read(Rails.root.join('lib', 'seeds', 'scenes13.csv'))
all_scenes13 = CSV.parse(scenes13, :headers => true, :encoding => 'ISO-8859-1')
all_scenes13.each do |row|
  t = Scene.new
  t.episode_id = row['Episode ID']
  t.scene_url = row['Screenshot Scene URL']
  t.description = row['Screenshot Scene (with numbers) URL']
  t.save!
end

scenes14 = File.read(Rails.root.join('lib', 'seeds', 'scenes14.csv'))
all_scenes14 = CSV.parse(scenes14, :headers => true, :encoding => 'ISO-8859-1')
all_scenes14.each do |row|
  t = Scene.new
  t.episode_id = row['Episode ID']
  t.scene_url = row['Screenshot Scene URL']
  t.description = row['Screenshot Scene (with numbers) URL']
  t.save!
end

sceneproducts13 = File.read(Rails.root.join('lib', 'seeds', 'sceneproducts13.csv'))
all_sceneproducts13 = CSV.parse(sceneproducts13, :headers => true, :encoding => 'ISO-8859-1')
all_sceneproducts13.each do |row|
  t = SceneProduct.new
  t.scene_id = row['Scene ID']
  t.seen_on = row['Seen On']
  t.product_annot = row['Product Annot']
  t.price = row['Price']
  t.title = row['Title']
  t.slashed_price = row['Slashed Price']
  t.free_gift = row['Free Gift']
  t.sizes = row['Sizes']
  t.colors = row['Colors']
  t.product_link = row['Product Link']
  t.picture_url = row['Picture URL']
  t.features = row['Features']
  t.save!
end

sceneproducts14 = File.read(Rails.root.join('lib', 'seeds', 'sceneproducts14.csv'))
all_sceneproducts14 = CSV.parse(sceneproducts14, :headers => true, :encoding => 'ISO-8859-1')
all_sceneproducts14.each do |row|
  t = SceneProduct.new
  t.scene_id = row['Scene ID']
  t.seen_on = row['Seen On']
  t.product_annot = row['Product Annot']
  t.price = row['Price']
  t.title = row['Title']
  t.slashed_price = row['Slashed Price']
  t.free_gift = row['Free Gift']
  t.sizes = row['Sizes']
  t.colors = row['Colors']
  t.product_link = row['Product Link']
  t.picture_url = row['Picture URL']
  t.features = row['Features']
  t.save!
end


