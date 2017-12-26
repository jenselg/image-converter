class ImageCleanerWorker
  include Sidekiq::Worker

  def perform(*args)
    Image.find_each do |image|
      if Time.now > image.created_at + 1.hour
        image.destroy
      end
    end
  end
  
end
