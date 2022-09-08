class CreateCandidatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :candidate_posts do |t|

      t.integer :member_id, null: false
      t.integer :book_id, null: false
      t.integer :recipient_id
      t.integer :consideration_status, null:false, default: "0"
      t.string :memo

      t.timestamps
    end
  end
end
