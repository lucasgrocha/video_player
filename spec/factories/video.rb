FactoryBot.define do
  factory :video do
    name        { FFaker::Lorem.words.join(' ') }
    description { FFaker::Lorem.paragraph }
    views       { rand(0..100) }
    user        { FactoryBot.create(:user) }

    before :create do |video|
      if Rails.env.development?
        vendor_dir = Rails.root.join('vendor')
        filename_videos = Dir.entries('vendor/videos').select { |f| !File.directory? f }

        file = File.open("#{vendor_dir}/videos/#{filename_videos.sample}")

        video.file = file
      end
    end
  end
end
