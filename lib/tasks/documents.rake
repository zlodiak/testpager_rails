namespace :db do
  desc "Create documents"
  task :populate_documents => :environment do
	require 'populator'
	require 'faker'
	  Document.populate 105 do |document|
		document.body = Faker::Lorem.paragraph(60)
		document.title = Faker::Name.title
	  end
	  puts 'All done'
  end
end

