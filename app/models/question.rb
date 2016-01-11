class Question < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user

  has_many :answers, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  validates :statement, presence: true
end
