class User < ActiveRecord::Base
  has_many :owned_books, foreign_key: :owner_user_id, class_name: "Book"
  has_many :reflections, foreign_key: :reflection_user_id
  has_many :reflection_books, through: :reflections
  validates :username, presence: true, uniqueness: { message: "This username already exists. Please try another."}
  validates :email, presence: true, uniqueness: { message: "This email has already been taken. Please try another."}
  validates :password, presence: true, length: { :within => 8..40 }
  scope :with_reflections, ->{ joins(:reflections).where("reflection_book_id >= ?", 5) }
  has_secure_password




end
