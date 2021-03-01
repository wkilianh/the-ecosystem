# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def add_users
  (1..6).each do |x|
    puts "creating user #{x}"
    User.create!(email: "kilian#{x}@gmail.com",
                password: "123456",
                nickname: "kilian#{x}",
                level: ["starter", "intermediate", "pro", "expert"].sample,
                slogan: "I know the REAL hacks!")
    puts "created user #{x}"
  end
end

def add_posts
  (1..6).each do |x|
    puts "creating post #{x}"
    Post.create!(user_id: x,
                category: ["hack", "don't", "project"].sample,
                title: "Post No. #{x}, Title",
                topic: ["household", "energy", "diy"].sample,
                expect_co2: ["modest", "moderate", "good", "strong"].sample,
                expect_waste: ["modest", "moderate", "good", "strong"].sample,
                expect_resources: ["modest", "moderate", "good", "strong"].sample,
                expect_diyeffort: ["modest", "moderate", "good", "strong"].sample,
                expect_ecocost: ["modest", "moderate", "good", "strong"].sample)
    puts "created post #{x}"
  end
end

def add_comments
  counter = 6
  (1..6).each do |x|
    Comment.create!(post_id: x, user_id: counter,
                    content: "Comment #{x} to Post #{x} from user #{x}")
    Comment.create!(post_id: x, user_id: counter,
                    content: "Comment #{x + 1} to Post #{x} from user #{x}")
  counter -= 1
  puts "created comments for post #{x}"
  end
end




add_users
add_posts
add_comments
