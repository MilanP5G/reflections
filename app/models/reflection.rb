class Reflection < ActiveRecord::Base
  belongs_to :reflection_user, class_name: "User"
  belongs_to :reflection_book, class_name: "Book"

  # validates :title, presence: { message: "Don't be afraid to add an eye-catching title." }
  # validates :content, presence: { message: "Don't be afraid to write a reflection." }, length: { in: 0..500, message: "Express yourself within 500 characters."}

  validates_presence_of :title, :content
  
end
