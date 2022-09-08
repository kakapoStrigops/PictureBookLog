class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|

      t.integer :member_id, null: false
      t.integer :review_id
      t.text :comment, null: false
      t.boolean :hidden_status, null: false, default: "false"

      t.timestamps
    end
  end
end
