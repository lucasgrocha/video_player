json.array!(@videos) do |video|
  json.id            video.id
  json.name          video.name
  json.description   video.description
  json.file_url      video.file.url
  json.thumbnail_url video.file.thumb.url
  json.user_name     video.user.name
  json.views         video.views
end

