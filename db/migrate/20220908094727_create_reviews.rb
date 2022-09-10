class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|

      t.integer :member_id, null: false
      t.string :isbn_code, null: false
      t.integer :recipient_id
      t.integer :recipient_age
      t.text :review, null: false
      t.boolean :hidden_status, null: false, default: "false"

      t.timestamps
    end
  end
end
