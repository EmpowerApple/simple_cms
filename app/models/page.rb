class Page < ActiveRecord::Base
  
  belongs_to :subject
  has_many :sections
  has_and_belongs_to_many :admin_users
  
  validates_presence_of :name
  
end
