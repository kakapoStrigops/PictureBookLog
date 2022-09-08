class CreateReviewTargetAgeTags < ActiveRecord::Migration[6.1]
  def change
    create_table :review_target_age_tags do |t|

      t.timestamps
    end
  end
end
