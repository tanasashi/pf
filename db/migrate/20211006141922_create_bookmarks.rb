class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|
      t.bigint :user
      t.bigint :post

      t.timestamps
    end
     add_reference :bookmarks, :user, foreign_key: true
     add_reference :bookmarks, :post, foreign_key: true

    
  end
end
