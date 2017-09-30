class User < ActiveRecord::Base
  has_many :comments
  has_many :votes
  has_many :answers
  has_many :questions

  validates :first_name, :last_name, presence: true
  validates :email, :username, presence: true, uniqueness: true
  validates :password, presence: true
end
