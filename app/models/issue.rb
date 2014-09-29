class Issue < ActiveRecord::Base;
  belongs_to :creator,foreign_key: 'user_id', class_name: 'User'
  belongs_to :project
  belongs_to :state
  belongs_to :severity
  belongs_to :priority
  has_many :comments
  accepts_nested_attributes_for :project
  validates :title, presence: true, uniqueness: true
  validates :description,  presence: true, uniqueness: true
  mount_uploader :image, ImageUploader
end

