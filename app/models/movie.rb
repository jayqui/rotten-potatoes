class Movie < ActiveRecord::Base
  validates :title, :admin, presence: true

  belongs_to :admin, class_name: "User"
  has_many :reviews
  has_many :comments, as: :commentable
  has_many :roles, dependent: :destroy
  has_many :actors, through: :roles
end
