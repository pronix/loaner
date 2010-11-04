class BooksController < InheritedResources::Base
  respond_to :html, :xml, :json

  def create
    @book = current_user.books.build params[:book]
    create! { books_path }
  end

  def update
    update! { edit_book_path(resource) }
  end

  private
  def collection
    @books = current_user.books
  end
end
