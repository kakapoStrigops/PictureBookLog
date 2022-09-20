class Public::BooksController < ApplicationController

  before_action :authenticate_member!

# # 検討途中
#   def search
#     # @books = []
#     @candidate_post = CandidatePost.new
#     @review = Review.new
#     @parameter = params[:parameter]
#     @keyword = params[:keyword]
#     @books = RakutenWebService::Books::Book.search_for(@parameter, @keyword)
#   end


  def search
    @books = []
    @candidate_post = CandidatePost.new
    @review = Review.new
    @parameter = params[:parameter]
    @keyword = params[:keyword]
    if @parameter == "title"
      @books = RakutenWebService::Books::Book.search({
        title: @keyword, booksGenreId: '001003',hits: 20,
        })
    elsif @parameter == "author"
      @books = RakutenWebService::Books::Book.search({
        author: @keyword, booksGenreId: '001003',hits: 20,
        })
    elsif @parameter == "publisherName"
      @books = RakutenWebService::Books::Book.search({
        publisherName: @keyword, booksGenreId: '001003',hits: 20,
        })
    elsif @parameter == "isbn"
      @books = RakutenWebService::Books::Book.search({
        isbn: @keyword, booksGenreId: '001003',hits: 20,
        })
    end
  end

end
