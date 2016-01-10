class Tag < ActiveRecord::Base
  has_many :tagging_relationships
  has_many :topics, :through => :tagging_relationships

  validates :name, uniqueness: { case_sensitive: false }
  
end
