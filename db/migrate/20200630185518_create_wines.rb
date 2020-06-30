class CreateWines < ActiveRecord::Migration[5.2]
  def change
    create_table :wines do |t|
      t.string :name
      t.string :color
      t.integer :year
      t.belongs_to :region, foreign_key: true
      t.belongs_to :varietal, foreign_key: true

      t.timestamps
    end
  end
end
