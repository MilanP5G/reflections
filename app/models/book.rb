class Book < ActiveRecord::Base
  has_many :reflections, foreign_key: :reflection_book_id
  has_many :reflection_users, through: :reflections, source: :reflection_user
  belongs_to :owner_user, class_name: "User"


end
