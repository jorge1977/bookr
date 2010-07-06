namespace :db do
  desc "Populate database with test data"
  task :populate => :environment do
    EMAIL_DOMAIN = 'bookr.com'

    puts "*** Deleting loaded data from database..."
    [User].each(&:delete_all)

    puts "*** Creating Users..."
    ["admin", "superman", "batman", "hulk"].each do |username|
      puts "*** -- Creating #{username}'s user account"
      user           = User.new
      user.full_name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
      user.email     = "#{username}@#{EMAIL_DOMAIN}"
      user.login     = username
      user.password  = user.password_confirmation = username
      user.save!
    end
  end
end
