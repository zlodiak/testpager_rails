namespace :db do
  desc "Create users"
  task :populate_users => :environment do
	require 'populator'
	require 'faker'
		admin = User.create!( name: 'addmin',
                          email: 'ad2@ad.ad',
                          password: 'qwerty1234',
                          password_confirmation: 'qwerty1234',
                          admin: true)
	  puts 'All done'
  end
end

