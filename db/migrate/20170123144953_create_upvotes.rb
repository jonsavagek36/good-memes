class CreateUpvotes < ActiveRecord::Migration[5.0]
  def change
    create_table :upvotes do |t|
      t.belongs_to :user
      t.belongs_to :review
      t.index [:user_id, :review_id], unique: true
      t.timestamps
    end
  end
end
