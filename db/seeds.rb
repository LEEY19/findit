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

csv_text2 = File.read(Rails.root.join('lib', 'seeds', 'products.csv'))
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

scenes = File.read(Rails.root.join('lib', 'seeds', 'scenes.csv'))
all_scenes = CSV.parse(scenes, :headers => true, :encoding => 'ISO-8859-1')
Episode.create(name: "Red Velvet Ep.01")
Episode.create(name: "Red Velvet Ep.02")
all_scenes.each do |row|
  t = Scene.new
  t.episode_id = row['Episode ID']
  t.scene_url = row['Screenshot URL']
  t.save!
  SceneProduct.create(scene_id: t.id, seen_on: "Naelofar", price: "RM149.00", title: "Bloom By Naelofar Hijab (3pcs set)", free_gift: nil, sizes: nil, colors: "Peachskin, Meteorite, Pigeon", discount_code: "FIRV13", discount_message: nil, product_link: "http://www.goshop.com.my/prd/20042419.html", picture_url: "http://image.goshop.com.my/resources/ms/image/contents/prd/24/19/20042419_06_1200.jpg", slashed_price: nil, features: "SERI : PEACHSKIN (Instant) \nKIRANA : METEORITE (Double loop) \nAURA : PIGEON(Semi-instant with attached inner)")
  SceneProduct.create(scene_id: t.id, seen_on: "Alif Satar", price: "RM489.60", title: "Esprit White Leather Strap Ladies Watch", free_gift: nil, sizes: nil, colors: "IP rose gold case", discount_code: "FIRV13", discount_message: nil, product_link: "http://www.goshop.com.my/prd/fashion/accessories/esprit-white-leather-strap-ladies-watch-es109112002/20040335.html", picture_url: "http://image.goshop.com.my/resources/ms/image/contents/prd/03/35/20040335_01_1200.jpg", slashed_price: "RM576.00", features: "mineral crystal \nwhite leather strap \nmother of pearl dial \nwater resistance 30m \n2 hand \ncase size 34mm \ncrystal stones on bezel")
end


