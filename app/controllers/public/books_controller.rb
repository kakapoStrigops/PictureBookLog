class Public::BooksController < ApplicationController


  def search
    @books = []
    @candidate_post = CandidatePost.new
    if params[:keyword]
      @books = RakutenWebService::Books::Book.search({
        title: params[:keyword],
        booksGenreId: '001003',
        hits: 20,
        })
    end



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

end
