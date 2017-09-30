class Answer < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  belongs_to :questions, class_name: "Question"
  has_many :comments, as: :commentable, index: true
  has_many :votes, as: :votable, index: true

  
  validates :body, presence: true
  validates :best_answer, presence: true
  validates :users_id, presence: true
end
