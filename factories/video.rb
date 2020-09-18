FactoryBot.define do
  factory :video do
    name        { FFaker::Lorem.paragraph }
    description { FFaker::Lorem.words.join(' ') }
    views       { rand(0..100) }

    before :create do |video|
      tmp_dir = Rails.root.join('tmp')
      filename_videos = Dir.entries('tmp/videos').select { |f| !File.directory? f }

      file = File.open("#{tmp_dir}/videos/#{filename_videos.sample}")

      video.file = file

    end
  end
end
