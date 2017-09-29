class User < ActiveRecord::Base
  has_many :comments
  has_many :votes
  has_many :answers
  has_many :questions
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
end
