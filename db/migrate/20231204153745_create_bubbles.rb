class CreateBubbles < ActiveRecord::Migration[7.0]
  def change
    create_table :bubbles do |t|
      t.integer :user1_id
      t.integer :user2_id
      t.float :similarity_score

      t.timestamps
    end
  end
end
