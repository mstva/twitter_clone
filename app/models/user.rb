class User < ApplicationRecord
  has_many :twits
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end
