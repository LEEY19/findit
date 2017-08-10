namespace :db do
  task :populate => :environment do
    require 'faker'
    Rake::Task['db:reset'].invoke

    Video.create(video_link: "https://www.youtube.com/watch?v=yE0BJMwGkRI", title: "Real Madrid vs Barcelona 2-3 - Highlights & Goals - 29 July 2017", picture: "https://static.sportskeeda.com/wp-content/uploads/2017/04/el-clasico-real-madrid-vs-barcelona-quiz-1492868790-800.jpg", duration: "05:40")
    Video.create(video_link: "https://www.youtube.com/watch?v=giYeaKsXnsI", title: Faker::Lorem.sentence, picture: "https://www.ablogofthrones.com/wp-content/uploads/2016/11/Night-King-and-Wight-Dragon-GoT-Season-7-Fan-Poster.jpg", duration: "05:40")
    Video.create(video_link: "https://www.youtube.com/watch?v=bPx31cajvWo", title: Faker::Lorem.sentence, picture: "http://4.bp.blogspot.com/-LVUJLQtWAqA/TZc09FEmZ4I/AAAAAAAAAJw/NOnkDLzkvtc/s1600/gossip-girl-season-3-1920-1440-5325.jpeg", duration: "05:40")
    Video.create(video_link: "https://www.youtube.com/watch?v=h7GiAwK2-fY", title: Faker::Lorem.sentence, picture: "https://images.fandango.com/r1.0.50/ImageRenderer/300/0/redesign/static/img/noxsquare.jpg/0/images/spotlight/gotg-vol-2-cast.jpg", duration: "05:40")
    Video.create(video_link: "https://www.youtube.com/watch?v=vo-UpkeVE1U", title: Faker::Lorem.sentence, picture: "https://www.dramafever.com/st/img/nowplay/4914_Goblin_Nowplay_Small_oxgPcrm.jpg", duration: "05:40")
  
    Video.all.each do |video|
      i = 0
      while i < 6
        i += 1
        video.products.create(title: Faker::Lorem.sentence, product_link: "http://www.lazada.com.my/2017-2018-barcelona-football-team-away-no10-messi-soccer-jerseysuits-47888758.html?spm=a2o4k.search.0.0.VbkUbj&ff=1", price: Faker::Number.decimal(2, 2), picture: "http://soccerpro.scene7.com/is/image/soccerpro/main/776846_481mes_nike_lionel_messi_barca_match_home_jsy_01.jpg")
      end
    end

  end
end
