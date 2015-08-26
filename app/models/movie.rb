class Movie < ActiveRecord::Base
  acts_as_votable
  validates :title, :admin, presence: true

  belongs_to :admin, class_name: "User"
  belongs_to :authorized_reviewer, class_name: "User"
  has_many :reviews
  has_many :comments, as: :commentable
  has_many :roles, dependent: :destroy
  has_many :actors, through: :roles
end
