class Actor < ActiveRecord::Base
  has_many :roles, dependent: :destroy
  has_many :movies, through: :roles
  has_many :comments, as: :commentable
end
