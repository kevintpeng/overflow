class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true, uniqueness: true

  has_many :questions
  has_many :answers
  has_many :comments

  has_many :evaluations, class_name: "RSEvaluation", as: :source

  has_reputation :votes, source: {reputation: :votes, of: :answers}, aggregated_by: :sum
end
