namespace :db do
  desc "Populate user types and tasks status"
  task populate: :environment do

    puts "Started to populate tables..."

    # if UserType.all.length == 0 
    #   user_types = ['Admin', 'Default']
    #   user_types.each do |type|
    #     UserType.find_or_create_by(description: type)
    #   end
    # end

    if User.all.length == 0 

      usernames = ['user1@email.com','user2@email.com','user2@email.com']

      usernames.each do |user|
        User.create(
          email: user,
          password: "1234",
          password_confirmation: "1234"
        )
      end
    end

    puts "Tables was populated successfully!"
  end
end
