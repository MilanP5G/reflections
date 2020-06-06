class Book < ActiveRecord::Base
  has_one_attached :image
  has_many :reflections, foreign_key: :reflection_book_id
  has_many :reflection_users, through: :reflections
  belongs_to :owner_user, class_name: "User"
  scope :recent, ->{ joins(:owner_user).group(:reflections).order("created_at DESC") }

  accepts_nested_attributes_for :reflections




end
