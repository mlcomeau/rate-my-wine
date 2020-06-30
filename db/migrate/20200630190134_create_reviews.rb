class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :stars
      t.string :content
      t.float :price
      t.belongs_to :wine, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
