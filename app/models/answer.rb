class Answer < ActiveRecord::Base
  belongs_to :user, :questions
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  validates :body, presence: true
  validates :best_answer, presence: true
  validates :users_id, presence: true
end
