class Image < ApplicationRecord
  belongs to item
  mount_uploader :image, ImageUploader
end
