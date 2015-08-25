class User < ActiveRecord::Base
  has_many :movies, foreign_key: :admin_id
  has_many :reviews, foreign_key: :reviewer_id
  has_many :comments, foreign_key: :commenter_id

  has_secure_password

end
