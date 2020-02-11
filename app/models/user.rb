class User < ApplicationRecord
  validates :name, presence: true
  validates :name, length: {maximum: 15}
  validates :email, presence: true
  validates :email, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  validates :subject, presence: true
  validates :password, presence: true
  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i}
  has_secure_password
  has_many :topics
end
