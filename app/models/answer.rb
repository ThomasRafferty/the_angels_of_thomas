class Answer < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  belongs_to :questions, class_name: "Question"
  has_many :comments, as: :commentable
  has_many :votes, as: :votable


  validates :body, presence: true
  validates :best_answer, presence: true
  validates :user_id, presence: true
end
