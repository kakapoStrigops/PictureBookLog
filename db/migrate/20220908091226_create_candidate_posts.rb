class CreateCandidatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :candidate_posts do |t|

      t.integer :member_id, null: false
      t.integer :recipient_id
      t.integer :consideration_status, null:false, default: "0"
      t.string :memo

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
