class Book < ActiveRecord::Base
  has_one_attached :image
  has_many :reflections, foreign_key: :reflection_book_id
  has_many :reflection_users, through: :reflections
  belongs_to :owner_user, class_name: "User"

  accepts_nested_attributes_for :reflections


end
