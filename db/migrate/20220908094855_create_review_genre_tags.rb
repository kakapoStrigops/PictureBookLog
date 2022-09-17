class CreateReviewGenreTags < ActiveRecord::Migration[6.1]
  def change
    create_table :review_genre_tags do |t|

      t.integer :review_id, null: false, foreign_key: true
      t.integer :genre_tag_id, null: false, foreign_key: true
      t.index ["review_id"], name: "index_review_genre_tags_on_review_id"
      t.index ["genre_tag_id"], name: "index_review_genre_tags_on_genre_tag_id"

      t.timestamps
    end
  end
end
