namespace :cleaner do

  desc "Clean Images From Server"
  task image_cleaner: :environment do
    puts "Start cleaning old images..."
    Image.find_each do |image|
      if Time.now > image.created_at + 1.hour
        image.destroy
      end
    end
    puts "...done cleaning old images."
  end

end
