class Video < ApplicationRecord
  mount_uploader :file, FileUploader
end
