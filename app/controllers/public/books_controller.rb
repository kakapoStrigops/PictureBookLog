class Public::BooksController < ApplicationController

  def search
    @books = []
    @book = Book.new
    # @candidate_post = CandidatePost.new
    if params[:keyword]
      @books = RakutenWebService::Books::Book.search({
        title: params[:keyword],
        booksGenreId: '001003',
        hits: 20,
        })
    end
  end

  def create
    @book = Book.update(book_params)
  end


  def new
  end

  def index
    if params[:keyword]
      @books = RakutenWebService::Books::Book.search({
        title: params[:keyword],
        booksGenreId: '001003',
        hits: 20,
        })
    end
  end

  def book_params
    params.require(:book).permit(:title, :author, :publisher, :date_of_publication, :isbn_code, :book_image_url, :rakuten_books_url)
  end


end
