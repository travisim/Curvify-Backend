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
    name:"Frank",
   username: "Frank",
   email: "frank@frank.com",
    password: "password",
    password_confirmation: "password",

   

  
  )
  10.times do |j|
    ForumThread.create(
      title: [" ","CS2103T","BSP1702"].sample,
      body: ["This course requires a Physical textbook for the finals","Notes are avaialble"].sample,
    category: ["Trade", "Buy with AvoCurve Coin", "Donations", "Other"].sample,
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
    
   name:"Dean",
   username: "Dean",
   email: "dean@dean.com",
    password: "password",
    password_confirmation: "password"

  
  )
  10.times do |j|
    ForumThread.create(
      title: ["ACC1701","CS2103T","BSP1702"].sample,
      body: ["This course requires a Physical textbook for the finals","Notes are avaialble"].sample,
 category: ["Trade", "Buy with AvoCurve Coin", "Donations", "Other"].sample,
    author: "Dean",
    user_id: 2
    )
    
  end
  10.times do |j|
    ForumThreadComment.create(
      
    body: ["i have just finished this course and would like to sell my physical textbook","I have quality notes"].sample,
      author: "Dean",
    forum_thread_id: Random.rand(10)+1,
    user_id: 2
    
    )
  end
end
