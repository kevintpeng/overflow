class Answer < ActiveRecord::Base
  belongs_to :question, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
end
