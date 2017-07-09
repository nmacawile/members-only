User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

@new_users = {}

@new_users[:spongebob] = User.create!(name: "SpongeBob", 
                                    email: "spongebob2@protonmail.com",
                                 password: "111111")

@new_users[:patrick] = User.create!(name: "Patrick", 
                                  email: "patrickstar1@protonmail.com",
                               password: "111111")

@new_users[:sandy] = User.create!(name: "Sandy",
                                email: "sandycheeks77777@gmail.com",
                             password: "111111")

def create_post(poster, post)
  Post.create!(user: @new_users[poster], content: post)
end

create_post :patrick, "Yeah. What's so great about dumb ol' Texas?"
create_post :sandy, "What did you say?"
create_post :patrick, "Texas is dumb?"
create_post :sandy, "Don't you dare take the name of Texas in vain!"
create_post :spongebob, "You mean we can't say anything bad about dumb ol' Texas?"
create_post :sandy, "No, you can't!"
create_post :patrick, "Then can we say people from Texas are dumb?"
create_post :sandy, "No! You can't say nothing about Texas!"
create_post :spongebob, "Oh, so you mean we can't say anything bad about... TEXAS?"
create_post :sandy, "I'm warnin' you, SpongeBob!"
create_post :spongebob, "Look Patrick, I'm Texas!\nDuh, howdy, y'all! Howdy y'all!"
create_post :patrick, "I'm Texas too!\nGet a dog little longie! Get a dog!"
create_post :spongebob, "Howdy y'all!"
create_post :patrick, "Get a dog little longie! Get a dog!"
create_post :sandy, "Y'all best cut it out!"
create_post :spongebob, "The stars at night are dull and dim,\nwhenever they have to be over dumb ol' stupid Texas!\nHey, Patrick, what am I now?"
create_post :patrick, "Uhh, stupid?"
create_post :spongebob, "No, I'm Texas!"
create_post :patrick, "What's the difference?!"
create_post :sandy, "Y'all best apologize, or I'm gonna be on you like ugly on an ape!"
create_post :spongebob, "You'll have to catch us first! We did it! We got her!"
create_post :patrick, "Krusty Krab, here we come! Can we say that plants from Texas are dumb? Can we say that shoes from Texas are dumb?"
create_post :spongebob, "Okay, Patrick, that's enough."
create_post :patrick, "Why? You think that old slowpoke Texas is gonnaijpih008iohj0ui9p"