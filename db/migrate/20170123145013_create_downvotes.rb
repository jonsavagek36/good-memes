class CreateDownvotes < ActiveRecord::Migration[5.0]
  def change
    create_table :downvotes do |t|
    end
  end
end
