module BookHelper

  def created(book)
    book.created_at.strftime("%d %B %Y")
  end

end
