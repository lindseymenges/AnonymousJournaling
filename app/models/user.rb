class User < ActiveRecord::Base
  attr_accessible :username, :password
  validates :username, presence: true
  validates :password, presence: true
  validates :username, uniqueness: true
  has_secure_password
  has_many :entries
end
