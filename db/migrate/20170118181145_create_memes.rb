class CreateMemes < ActiveRecord::Migration[5.0]
  def change
    create_table :memes do |t|
      t.string :name, null: false
      t.string :img_url, null: false
      t.belongs_to :category, null: false
      t.belongs_to :user, null: false

      t.timestamps
    end
  end
end
