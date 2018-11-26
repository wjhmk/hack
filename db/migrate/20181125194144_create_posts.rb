class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :post_title
      t.text :post_content
      t.string :post_image
      t.integer :comment_id

      t.timestamps
    end
  end
end
