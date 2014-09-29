class Project < ActiveRecord::Base;
  include Sluggable
  belongs_to :creator,foreign_key: 'user_id', class_name: 'User'
  has_many :issues
  validates :name, presence: true, uniqueness: true
  validates :url,  presence: true, uniqueness: true
  sluggable_column :name
end