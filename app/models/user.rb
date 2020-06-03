class User < ActiveRecord::Base
  has_many :owned_books, foreign_key: :owner_user_id, class_name: "Book"
  has_many :reflections, foreign_key: :reflection_user_id
  has_many :reflection_books, through: :reflections
  has_secure_password


end
