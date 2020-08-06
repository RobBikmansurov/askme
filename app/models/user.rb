class User < ApplicationRecord

  has_many :questions

  validates :name, :username, :email, presence: true
  validates :email, :username, uniqueness: true

end
