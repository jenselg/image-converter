namespace :cleaner do

  desc "Clean Edited Images From Server"
  task image_editor_cleaner: :environment do
    puts "Start cleaning old images..."
    Image.find_each do |image|
      if Time.now > image.created_at + 1.hour
        image.destroy
      end
    end
    puts "...done cleaning old images."
  end

  desc "Clean Converted Images From Server"
  task image_converter_cleaner: :environment do
    puts "Start cleaning old images..."
    ConvertImage.find_each do |image|
      if Time.now > image.created_at + 5.minutes
        image.destroy
      end
    end
    puts "...done cleaning old images."
  end

end
