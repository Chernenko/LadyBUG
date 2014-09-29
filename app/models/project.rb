class Project < ActiveRecord::Base;
belongs_to :creator,foreign_key: 'user_id', class_name: 'User'
  has_many :issues
validates :name, presence: true, uniqueness: true
validates :url,  presence: true, uniqueness: true
end