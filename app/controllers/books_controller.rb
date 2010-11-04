class BooksController < InheritedResources::Base
  respond_to :html, :xml, :json

  def create
    create! { books_path }
  end

  def update
    update! { edit_book_path(resource) }
  end
end
