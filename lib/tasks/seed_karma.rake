namespace :seed do
  desc "seed karma column in users table"
  task :karma => :environment do
    User.find_each do |user|
      user.update_attribute(:total_karma, user.sum_karma)
   end
 end
end
