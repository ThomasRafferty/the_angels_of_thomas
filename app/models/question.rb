class Question < ActiveRecord::Base
  belongs_to :user, class_name: "User", foreign_key: "user_id"
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates :body, presence: true
  validates :title, presence: true
  validates :user_id, presence: true
end
