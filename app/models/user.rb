class User < ActiveRecord::Base
  has_many :owned_books, foreign_key: :owner_user_id, class_name: "Book"
  has_many :reflections, foreign_key: :reflection_user_id
  has_many :reflection_books, through: :reflections

  validates :username, presence: { message: "You must enter a username."}, uniqueness: { message: "This username already exists. Please try another."}
  validates :email, presence: { message: "You must enter a valid email."}, uniqueness: { message: "This email has already been taken. Please try another."}
  validates :password, presence: { message: "You must enter a password."}, length: { :within => 8..40, message: "Your password must be a minimum of 8 characters." }

  scope :with_reflections, ->{ joins(:reflections).where("reflection_book_id >= ?", 1).order("created_at DESC") }

  has_secure_password validations: false




end
