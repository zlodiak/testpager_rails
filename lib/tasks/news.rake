namespace :db do
  desc "Create news"
  task :populate_news => :environment do
	require 'populator'
	require 'faker'
	  News.populate 100 do |news|
		news.body = Faker::Lorem.paragraph(40)
		news.title = Faker::Name.title
		news.image_url = Faker::Avatar.image("my-own-slug")
	  end
	  puts 'All done'
  end
end

