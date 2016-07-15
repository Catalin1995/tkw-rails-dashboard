class News < ActiveRecord::Base
  mount_uploader :image, NewsUploader

  validates :image, presence: true
end
