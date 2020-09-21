FactoryBot.define do
  factory :video do
    name        { FFaker::Lorem.words.join(' ') }
    description { FFaker::Lorem.paragraph }
    views       { rand(0..100) }
    user        { FactoryBot.create(:user) }

    before :create do |video|
      if Rails.env.development?
        tmp_dir = Rails.root.join('tmp')
        filename_videos = Dir.entries('tmp/videos').select { |f| !File.directory? f }

        file = File.open("#{tmp_dir}/videos/#{filename_videos.sample}")

        video.file = file
      end
    end
  end
end
