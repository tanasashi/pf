class CreatePrefectures < ActiveRecord::Migration[5.2]
  def change
    create_table :prefectures do |t|

      t.integer :user_id
      t.string :image_id
      t.string :place_name
      t.string :address
      t.text :point
      t.string :detail

      t.timestamps
    end
  end
end

