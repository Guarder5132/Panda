class CreatePinluns < ActiveRecord::Migration
  def change
    create_table :pinluns do |t|
      t.integer :user_id
      t.integer :micropost_id
      t.string :content

      t.timestamps
    end
    add_index :pinluns, [:micropost_id, :created_at]
  end
end
