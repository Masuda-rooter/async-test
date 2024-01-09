class BooksController < ApplicationController
  # GET /books
  def index
    @q = Book.ransack(params[:q])
    @q.sorts = 'title asc'
    @books = @q.result
    title_count_promise = @books.distinct.async_count(:title)
    author_count_promise = @books.distinct.async_count(:author)
    publisher_count_promise = @books.distinct.async_count(:publisher)
    @title_count = title_count_promise.value
    @author_count = author_count_promise.value
    @publisher_count = publisher_count_promise.value
  end
end
