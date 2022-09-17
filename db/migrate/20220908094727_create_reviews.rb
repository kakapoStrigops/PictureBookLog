class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|

      t.integer :member_id, null: false
      t.integer :recipient_id
      t.integer :recipient_age
      t.text :review
      t.boolean :hidden_status, null: false, default: "false"

      # 本の情報
      t.string :title, null: false
      t.string :author, null: false
      t.string :publisher, null: false
      t.string :date_of_publication, null: false
      t.string :isbn_code, null: false
      t.text :book_image_url, null: false
      t.text :rakuten_books_url, null: false

      t.timestamps
    end
  end
end
