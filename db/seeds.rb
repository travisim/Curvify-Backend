# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
1.times do |i|
  User.create(
    
   username: "Frank"

  
  )
  10.times do |j|
    ForumThread.create(
      title: ["Trade rooms (A23-P24)?","Trade Books","Trade Crypto (DOGE-SHIB)","Trade ipad for Airpods Max"].sample,
      body: ["Trade with me pls","I'll add in 2 Avocurve coins"].sample,
    category:["Barter","Buy with AvoCurve Coin","Off-Advice","Others"].sample,
    author: "Frank",
    user_id: 1
    )
    
  end
  10.times do |j|
    ForumThreadComment.create(
      
      body: ["PM","well could i offer my tutor services in exchange instead?"].sample,
      author: "Frank",
    forum_thread_id: Random.rand(10)+1,
    user_id: 1
    
    )
  end
end

1.times do |i|
  User.create(
    
   username: "Dean"

  
  )
  10.times do |j|
    ForumThread.create(
      title: ["Trade rooms (A23-P24)?","Trade Books","Trade Crypto (DOGE-SHIB)","Trade ipad for Airpods Max"].sample,
      body: ["Trade with me pls","I'll add in 2 Avocurve coins"].sample,
    category:["Barter","Buy with AvoCurve Coin","Off-Advice","Others"].sample,
    author: "Dean",
    user_id: 2
    )
    
  end
  10.times do |j|
    ForumThreadComment.create(
      
    body: ["PM","well could i offer my tutor services in exchange instead?"].sample,
      author: "Dean",
    forum_thread_id: Random.rand(10)+1,
    user_id: 2
    
    )
  end
end
