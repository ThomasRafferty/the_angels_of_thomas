class Answer < ActiveRecord::Base
  belongs_to :user, :questions
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
end
