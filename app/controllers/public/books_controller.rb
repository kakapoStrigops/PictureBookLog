class Public::BooksController < ApplicationController

  before_action :authenticate_member!

  def search
    @books = []
    @candidate_post = CandidatePost.new
    @review = Review.new
    @parameter = params[:parameter]
    if @parameter == "title"
      params[:keyword]
      @books = RakutenWebService::Books::Book.search({
        title: params[:keyword],
        booksGenreId: '001003',hits: 20,
        })
    elsif @parameter == "author"
      params[:keyword]
      @books = RakutenWebService::Books::Book.search({
        author: params[:keyword],
        booksGenreId: '001003',hits: 20,
        })
    elsif @parameter == "publisherName"
      params[:keyword]
      @books = RakutenWebService::Books::Book.search({
        publisherName: params[:keyword],
        booksGenreId: '001003',hits: 20,
        })
    elsif @parameter == "isbn"
      params[:keyword]
      @books = RakutenWebService::Books::Book.search({
        isbn: params[:keyword],
        booksGenreId: '001003',hits: 20,
        })
    end
  end

end
