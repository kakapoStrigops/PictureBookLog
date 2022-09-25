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
    }
    ]

  test_posts.each do |test_post|
    CandidatePost.find_or_create_by(test_post)
  end
end