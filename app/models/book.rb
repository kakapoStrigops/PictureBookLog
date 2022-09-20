class Book < ApplicationRecord

# # 検討途中
#   def self.search_for(parameter, keyword)
#     if parameter == "title"
#       @books = RakutenWebService::Books::Book.search({title: keyword, booksGenreId: '001003',hits: 20})
#     elsif parameter == "author"
#       @books = RakutenWebService::Books::Book.search({author: keyword, booksGenreId: '001003',hits: 20})
#     elsif parameter == "publisherName"
#       @books = RakutenWebService::Books::Book.search({publisherName: keyword, booksGenreId: '001003',hits: 20})
#     elsif parameter == "isbn"
#       @books = RakutenWebService::Books::Book.search({isbn: keyword, booksGenreId: '001003',hits: 20})
#     else
#       @books = []
#     end
#   end

end
