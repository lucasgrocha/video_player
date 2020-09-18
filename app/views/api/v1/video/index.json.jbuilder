json.array!(@videos) do |video|
  json.id video.id
  json.name video.name
  json.description video.description
  json.file_url video.file.url
end

