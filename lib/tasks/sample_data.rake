namespace :db do
  desc "Fill database with sample data"
  task :fill => :environment do
    Rake::Task['db:reset'].invoke
    make_users
    make_stories
    make_comments
    #make_relationships
  end

  task :fillpro do
    Rake::Task['db:reset'].invoke
    make_users
    make_stories
    make_comments
    #make_relationships
  end
end

def make_users
  admin = User.create!(:name => "Mokevnin Kirill",
                       :email => "mokevnin@gmail.com",
                       :password => "password",
                       :password_confirmation => "password")
  #admin.toggle!(:admin)
  20.times do |n|
    name  = Faker::Name.name
    #email = "partos#{n+1}@gmail.com"
    email = Faker::Internet.free_email(name)
    password  = "password"
    User.create!(:name => name,
                 :email => email,
                 :password => password,
                 :password_confirmation => password)
  end
end

def make_stories
  users = User.all
  35.times do |n|
    title  = Faker::Name.title
    description = Faker::Lorem.sentence(5)
    dt = DateTime.now
    Story.create!(:title => title,
                 :description => description,
                 :deadline => dt,
                 :performer_id => users[rand(4)].id,
                 :creator_id => users[rand(4)].id)
    end
end

  def make_comments
    users = User.all
    stories = Story.all
    50.times do |n|
      body = Faker::Lorem.sentence(10)
      st = StoryComment.create(:body => body)
      st.user = users[rand(4)]
      st.story = stories[rand(4)]
      st.save
    end
end