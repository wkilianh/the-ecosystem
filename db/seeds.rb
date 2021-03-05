# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'faker'

def add_users # creates 6 users
  (1..6).each do |x|
    puts "creating user #{x}"
    user = User.new(email: "kilian#{x}@gmail.com",
                    password: "123456",
                    nickname: "kilian#{x}",
                    level: ["starter", "intermediate", "pro", "expert"].sample,
                    slogan: "I know the REAL hacks!")
    user.prof_pic.attach(io: File.open("db/seed_prof-pics/prof_pic#{x}.jpg"), filename: "#{x}.jpg", content_type: 'image/png')
    user.save!
    puts "created user #{x}"
  end
end

def add_posts # creates 6 posts
  (1..6).each do |x|
    puts "creating post #{x}"
    post = Post.new(user_id: x,
                    category: ["hack", "don't", "project"].sample,
                    title: "Post No. #{x}, Title",
                    topic: ["household", "energy", "diy"].sample,
                    expect_co2: ["low", "moderate", "medium", "high", "very high"].sample,
                    expect_waste: ["low", "moderate", "medium", "high", "very high"].sample,
                    expect_resources: ["low", "moderate", "medium", "high", "very high"].sample,
                    expect_diyeffort: ["low", "moderate", "medium", "high", "very high"].sample,
                    expect_ecocost: ["low", "moderate", "medium", "high", "very high"].sample)
    post.photos.attach(io: File.open("db/seed_post-images/post#{x}.jpg"), filename: "#{x}.jpg", content_type: 'image/png')
    # post.photos.attach(io: File.open("db/seed_post-images/post#{x}a.jpg"), filename: "#{x}a.jpg", content_type: 'image/png')
    post.save!
    puts "created post #{x}"
  end
end

def add_ratings
  (1..6).each do |x|
    a = [0,1,2,3,4,5].sample
    b = [0,1,2,3,4,5].sample
    c = [0,1,2,3,4,5].sample
    d = [0,1,2,3,4,5].sample
    e = [0,1,2,3,4,5].sample
    avg = (a + b + c + d + e) / 5.00
    rating = Rating.new(co2: a,
                      waste: b,
                      resources: c,
                      diyeffort: d,
                      ecocost: e,
                      avg: avg)
    rating.post_id = x
    rating.user_id = 7 - x # change this if number of ratings changes!
    rating.save!
    puts "created ratings for post #{x}"
  end
end

def add_comments # creates 12 comments, 2 on each post
  counter = 6
  (1..6).each do |x|
    Comment.create!(post_id: x, user_id: counter,
                    content: "Comment #{x} to Post #{x} from user #{x}: #{Faker::ChuckNorris.fact}")
    Comment.create!(post_id: x, user_id: counter,
                    content: "Comment #{x + 1} to Post #{x} from user #{x}: #{Faker::ChuckNorris.fact}")
  counter -= 1
  puts "created comments for post #{x}"
  end
end

def add_replies # puts 2 replies on each comment
  (1..12).each do |x|
    Reply.create!(comment_id: x, user_id: rand(1..6),
                  content: "#{Faker::ChuckNorris.fact}")
    puts "created reply for comment #{x}"
  end

end

def add_conversation # add conversations to user kilian1 and kilian2
  Conversation.create!(sender_id: 1, receiver_id: 2)
  puts "added conversation between user_id 1 and 2 (kilian1 and kilian2"
end

def add_messages # create in total 10 messages for the user 1 and 2
  (1..10).each do |x|
    y = [1, 2].sample
    Message.create(conversation_id: 1, user_id: y, content: "#{Faker::ChuckNorris.fact}")
    puts "added message from user_id: #{y} to conversation_id: 1"
  end
end

def add_rich_text_to_posts
  Post.all.each do |post|
    post.rich_body = "<div class='trix-content'><h1><strong>Saving resources with your phones</strong></h1><div><br><em>I thought I would put on here what I have redone on my phone.<br>I am interested in more info as well. I don't know a lot about it.</em><br>Basically, people get rid of their old phones because it is <strong>'SO slowwwwwww'.</strong><br>Or the battery runs out.<br>I think it was Apple that built in to their phones to slow down after two or three years.<br>So I imagine others do it too.<br>Android wise, as I understand it, Android is an open source OS.<br>Then companies get hold of it and bolt a load of stuff on it because they can sell the space on the phone to companies with apps.<br>They also make it so that you can't remove said apps.<br>A number of apps start and are running even if you don't want them to.<br>A bunch of info is sent from your phone to somewhere on a regular basis.<br><strong>Basically you are not really in control of your phone.</strong><br><br></div><ul><li>Also, I don't think one country should hold quite so much info on everyone. It can only go wrong at some point.</li><li>So, I generally buy a (used) phone that it is possible (with a bit of a YT watch and a priser tool) to change the battery.</li><li>Plus one that I have checked I can change the OS on.</li></ul><div><br>I have only tried <a href='https://en.wikipedia.org/wiki/Ubuntu_Touch'>Ubuntu Touch </a>(but the bluetooth doesn't always work on that and i use it all day in the van) and LineagOS.<br>Because Lineage seems very stable and quite popular.<br>It allows me to be in charge of what apps I have on my phone and what apps are running.<br>So, I effectively have more battery as things are not running in the background, so you need to charge it less.<br>Plus I use up less storage as I can remove whatever I like.<br>It is like having a better phone. So you don't have to replace it as quickly.<br><br>I can still download Open Source apps.<br>I have just discovered that I can download Google play store apps without logging in.<br>(I really only wanted one app from there)<br><br>Anyway, I thought I would mention it as I have at last got as far as doing it to this phone.</div></div>"
    post.save!
    puts "added rich text to post #{post}"
  end
end


add_users
add_posts
add_comments
add_replies
add_conversation
add_messages
add_rich_text_to_posts
add_ratings
