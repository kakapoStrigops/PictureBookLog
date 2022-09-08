class CreateReviewGenreTags < ActiveRecord::Migration[6.1]
  def change
    create_table :review_genre_tags do |t|

      t.integer :review_id, null: false
      t.integer :genre_tag_id, null: false

      t.timestamps
    end
  end
end
