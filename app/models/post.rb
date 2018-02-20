class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments ,  dependent: :destroy
  validates :content, length: { minimum: 1 }




   mount_uploader :image, ImageUploader
  validates_integrity_of  :image
  validates_processing_of :image




 
  private
    def image_size_validation
      errors[:image] << "should be less than 2MB" if image.size > 2.megabytes
    end




end
