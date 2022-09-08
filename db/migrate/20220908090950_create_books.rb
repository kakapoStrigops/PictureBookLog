class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|

      t.string :title, null: false
      t.string :suthor, null: false
      t.string :publisher
      t.string :date_of_publication
      t.string :isbn_code
      t.text :book_image_url
      t.text :rakuten_books_url, null: false

      t.timestamps
    end
  end
end
