class Reflection < ActiveRecord::Base
  belongs_to :reflection_user, class_name: "User"
  belongs_to :reflection_book, class_name: "Book"

end
