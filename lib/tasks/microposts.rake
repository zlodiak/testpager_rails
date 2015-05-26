namespace :db do
  desc "Create microposts"
  task :populate_microposts => :environment do
  	require 'populator'
  	require 'faker'

  	users = User.limit(13)
  	50.times do
    	content = Faker::Lorem.sentence(5)
    	users.each { |user| user.microposts.create!(content: content) }
    end

    puts 'All done'
  end
end

