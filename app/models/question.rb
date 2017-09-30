class Question < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  has_many :comments, as: :commentable, index: true
  has_many :votes, as: :votable, index: true

  validates :body, presence: true
  validates :title, presence: true
  validates :users_id, presence: true
end
