class BooksController < ApplicationController
  # GET /books
  def index
    @q = Book.ransack(params[:q])
    @q.sorts = 'title asc'
    @books = @q.result
    @title_count = @books.distinct.count(:title)
    @author_count = @books.distinct.count(:author)
    @publisher_count = @books.distinct.count(:publisher)
  end
end
