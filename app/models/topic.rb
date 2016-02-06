class Topic < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  has_many :tagging_relationships
  has_many :tags, :through => :tagging_relationships
  has_many :comments, as: :commentable, dependent: :destroy

  # called by form, displays all tags in a list for the edit/new form
  def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join ", "
  end

  # virtual attribute definition, when tag_list is passed through params
  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    topic_tags = tag_names.collect {|name| Tag.find_or_create_by(name: name)}
    self.tags = topic_tags
  end
end
