class TaggingRelationship < ActiveRecord::Base
  belongs_to :topic
  belongs_to :tag
end
