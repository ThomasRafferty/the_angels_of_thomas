class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :votable, index: true
  validates :body, presence: true
  validates :users_id, presence: true
end
