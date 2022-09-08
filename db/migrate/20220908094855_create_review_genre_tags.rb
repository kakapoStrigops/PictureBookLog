class CreateReviewGenreTags < ActiveRecord::Migration[6.1]
  def change
    create_table :review_genre_tags do |t|

      t.timestamps
    end
  end
end
