class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :users_id
      t.references :commentable, null: false, polymorphic: true, index: true

      t.timestamp
    end
  end
end
