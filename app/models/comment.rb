class Comment < ActiveRecord::Base
  # polymorphic association allows comments to belong to more than one model
  belongs_to :commentable, polymorphic: true
  belongs_to :user
end
