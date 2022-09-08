class CreateCandidatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :candidate_posts do |t|

      t.timestamps
    end
  end
end
