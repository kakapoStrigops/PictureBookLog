# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者アカウント作成
Admin.find_or_create_by(email: ENV['ADMIN_EMAIL']) do |admin|
  admin.password = ENV['ADMIN_PASSWORD']
end

# 以下はテストデータ
(0..99).each do |n|
  Member.find_or_create_by(email: "test#{n}@example.com") do |member|
    member.password = "123456"
    member.name = "test#{n}"
    member.name_kana = "test#{n}"
    member.nickname = "nickname#{n}"
    member.year_of_birth = 1999 - (n%20)
    member.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-member#{n%10}.png"), filename: "sample-member#{n%10}.png")
  end
end

(0..9).each do |n|
  TargetAgeTag.find_or_create_by(target_age: "#{n}歳向け")
end

test_genres = ["どうぶつ", "むし", "さかな", "植物", "食べ物", "のりもの", "昔話", "親子", "友達", "図鑑"]
test_genres.each do |test_genre|
  GenreTag.find_or_create_by(genre: test_genre)
end


(1..10).each do |n|
  test_posts = [
    {
      member_id: n,
      title: "英語でもよめるじぶんだけのいろ",
      author: "レオ・レオニ/谷川俊太郎",
      publisher: "好学社",
      date_of_publication: "2018年05月",
      isbn_code: "9784769020301",
      book_image_url:
       "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/0301/9784769020301.jpg?_ex=120x120",
      rakuten_books_url: "https://books.rakuten.co.jp/rb/15459075/"
    },{
      member_id: n,
      title: "ボードブック はらぺこあおむし",
      author: "エリック・カール/もり　ひさし",
      publisher: "偕成社",
      date_of_publication: "2012年12月",
      isbn_code: "9784032371109",
      book_image_url:
       "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/1109/9784032371109.jpg?_ex=120x120",
      rakuten_books_url: "https://books.rakuten.co.jp/rb/921996/"
    },{
      member_id: n,
      title: "ねこは　るすばん",
      author: "町田 尚子",
      publisher: "ほるぷ出版",
      date_of_publication: "2020年09月10日頃",
      isbn_code: "9784593100965",
      book_image_url: "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/0965/9784593100965.jpg?_ex=120x120",
      rakuten_books_url: "https://books.rakuten.co.jp/rb/16376411/"
    },{
      member_id: n,
      title: "コロちゃんのおさんぽ",
      author: "エリック・ヒル/松川真弓",
      publisher: "評論社",
      date_of_publication: "1983年03月",
      isbn_code: "9784566002074",
      book_image_url: "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/2074/9784566002074.jpg?_ex=120x120",
      rakuten_books_url: "https://books.rakuten.co.jp/rb/106436/"
    }, {
      member_id: n,
      title: "ペンギンのおかいもの",
      author: "坂崎千春",
      publisher: "WAVE出版",
      date_of_publication: "2014年10月",
      isbn_code: "9784872909159",
      book_image_url: "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/9159/9784872909159.jpg?_ex=120x120",
      rakuten_books_url: "https://books.rakuten.co.jp/rb/12956106/"
    }
    ]

  test_posts.each do |test_post|
    CandidatePost.find_or_create_by(test_post)
  end
end

(1..10).each do |n|
  test_reviews = [
    {
      member_id: n,
      review: "レビュー#{n}です。おすすめです。",
      title: "しろくまちゃんのほっとけーき",
      author: "若山憲",
      publisher: "こぐま社",
      date_of_publication: "1972年10月",
      isbn_code: "9784772100311",
      book_image_url:
       "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/0311/9784772100311.jpg?_ex=120x120",
      rakuten_books_url: "https://books.rakuten.co.jp/rb/208362/"
    },{
      member_id: n,
      review: "レビュー#{10+n}です。おすすめです。",
      title: "ボードブック はらぺこあおむし",
      author: "エリック・カール/もり　ひさし",
      publisher: "偕成社",
      date_of_publication: "2012年12月",
      isbn_code: "9784032371109",
      book_image_url:
       "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/1109/9784032371109.jpg?_ex=120x120",
      rakuten_books_url: "https://books.rakuten.co.jp/rb/921996/"
    },{
      member_id: n,
      review: "レビュー#{20+n}です。おすすめです。",
      title: "ねこいる！",
      author: "たなか　ひかる",
      publisher: "ポプラ社",
      date_of_publication: "2022年02月09日頃",
      isbn_code: "9784591172308",
      book_image_url:
       "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/2308/9784591172308_1_6.jpg?_ex=120x120",
      rakuten_books_url: "https://books.rakuten.co.jp/rb/17012509/"
    },{
      member_id: n,
      review: "レビュー#{30+n}です。おすすめです。",
      title: "コロちゃんのおさんぽ",
      author: "エリック・ヒル/松川真弓",
      publisher: "評論社",
      date_of_publication: "1983年03月",
      isbn_code: "9784566002074",
      book_image_url: "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/2074/9784566002074.jpg?_ex=120x120",
      rakuten_books_url: "https://books.rakuten.co.jp/rb/106436/"
    }, {
      member_id: n,
      review: "レビュー#{40+n}です。おすすめです。",
      title: "わたしのワンピース",
      author: "にしまき　かやこ",
      publisher: "こぐま社",
      date_of_publication: "1969年12月",
      isbn_code: "9784772100182",
      book_image_url:
       "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/0182/9784772100182_1_2.jpg?_ex=120x120",
      rakuten_books_url: "https://books.rakuten.co.jp/rb/248699/"
    }
    ]

  test_reviews.each do |test_review|
    Review.find_or_create_by(test_review)
  end
end

(1..50).each do |n|
  ReviewGenreTag.find_or_create_by(review_id: n, genre_tag_id: n%10)
  ReviewTargetAgeTag.find_or_create_by(review_id: n, target_age_tag_id: (n+5)%10)
end