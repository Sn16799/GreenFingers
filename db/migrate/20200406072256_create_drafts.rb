class CreateDrafts < ActiveRecord::Migration[5.2]
  def change
    create_table :drafts do |t|
      t.integer :user_id, null: false
      t.string :title
      t.text :content, null: false

      t.timestamps
    end
  end
end
