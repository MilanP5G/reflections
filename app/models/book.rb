class Book < ActiveRecord::Base
  has_one_attached :image
  has_many :reflections, foreign_key: :reflection_book_id
  has_many :reflection_users, through: :reflections
  belongs_to :owner_user, class_name: "User", optional: true

  validates :title, presence: { message: "You must enter a book title." }
  validates :author, presence: { message: "You must enter the author's name of the book." }
  validates :image, presence: { message: "Please upload an image of the book cover." }

  accepts_nested_attributes_for :reflections




end
