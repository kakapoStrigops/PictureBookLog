class CreateReviewTargetAgeTags < ActiveRecord::Migration[6.1]
  def change
    create_table :review_target_age_tags do |t|

      t.integer :review_id, null: false, foreign_key: true
      t.integer :target_age_tag_id, null: false, foreign_key: true
      t.index ["review_id"], name: "index_review_target_age_tags_on_review_id"
      t.index ["target_age_tag_id"], name: "index_review_target_age_tags_on_target_age_tag_id"

      t.timestamps
    end
  end
end
