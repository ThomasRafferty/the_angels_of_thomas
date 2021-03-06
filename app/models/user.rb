class User < ActiveRecord::Base
  has_many :comments
  has_many :votes
  has_many :answers
  has_many :questions, class_name: "Question", foreign_key: "user_id"

  validates :first_name, :last_name, presence: true
  validates :email, :username, presence: true, uniqueness: true
  validates :password, presence: true

  has_secure_password

  def authenticate(password)
    self.password == password
  end
end
