class Topic < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  has_many :tagging_relationships
  has_many :tags, :through => :tagging_relationships
  has_many :comments, as: :commentable, dependent: :destroy

end
