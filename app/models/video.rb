class Video < ApplicationRecord
  mount_uploaders :files, FileUploader
end
