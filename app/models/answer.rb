class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  has_many :comments, as: :commentable, dependent: :destroy

  #validates :response, :presence => true

  has_reputation :votes, source: :user, aggregated_by: :sum

end
