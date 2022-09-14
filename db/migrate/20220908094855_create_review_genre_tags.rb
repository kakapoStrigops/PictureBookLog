class CreateReviewGenreTags < ActiveRecord::Migration[6.1]
  def change
    create_table :review_genre_tags do |t|

      t.references :review, foreign_key: true
      t.references :genre_tag, foreign_key: true

      t.timestamps
    end
  end
end
