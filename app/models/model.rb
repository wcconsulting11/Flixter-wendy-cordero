class Model < ApplicationRecord
  mount_uploaders :file, ModelUploader
  attr_accessor :file
  mount_uploaders :image, ImageUploader
  serialize :image, JSON
  mount_uploader :video, VideoUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
