class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|
      t.references :user, type: :integer, foreign_key: true
      t.references :post, type: :integer, foreign_key: true

      t.timestamps
    end
    
  end
end
