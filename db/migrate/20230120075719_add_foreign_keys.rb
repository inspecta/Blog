class AddForeignKeys < ActiveRecord::Migration[7.0]
  def change
    #Comments
    add_reference :comments, :author, index: true, foreign_key:{to_table: :users}
    add_reference :comments, :post, index: true, foreign_key:true

    #Likes
    add_reference :likes, :author, index: true, foreign_key:{to_table: :users}
    add_reference :likes, :post, index: true, foreign_key: true
    # t.references :author, null: false, index: true, foreign_key: {to_table: :users}
    # t.references :post,  null: false, index: true, foreign_key: true

    #Posts
    add_reference :posts, :author, index: true, foreign_key: {to_table: :users}

  end
end
