class User < ActiveRecord::Base;
  has_many :projects
  has_many :comments
  has_many :issues
  has_secure_password
  validates :username, presence: true, uniqueness: true
  mount_uploader :image, ImageUploader



end