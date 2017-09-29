class Question < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  validates :body, presence: true
  validates :title, presence: true
  validates :users_id, presence: true
end
