class CreateReviewTargetAgeTags < ActiveRecord::Migration[6.1]
  def change
    create_table :review_target_age_tags do |t|

      t.integer :review_id, null: false
      t.integer :target_age_tag_id, null: false

      t.timestamps
    end
  end
end
