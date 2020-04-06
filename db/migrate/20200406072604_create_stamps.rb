class CreateStamps < ActiveRecord::Migration[5.2]
  def change
    create_table :stamps do |t|
      t.integer :user_id
      t.integer :blog_id
      t.integer :stamp_img

      t.timestamps
    end
  end
end