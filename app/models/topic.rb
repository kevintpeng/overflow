class Topic < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  has_many :tagging_relationships
  has_many :tags, :through => :tagging_relationships
  has_many :comments, as: :commentable, dependent: :destroy

  # displays all tags in a list for the edit/new form
  def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join ", "
  end
end
