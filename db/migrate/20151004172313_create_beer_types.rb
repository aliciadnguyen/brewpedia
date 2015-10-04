class CreateBeerTypes < ActiveRecord::Migration
  def change
    create_table :beer_types do |t|
      t.text :appearance
      t.text :smell
      t.text :taste
      t.text :overall
      t.text :location
      t.text :brewery
      t.references :beer
      t.timestamps null: false
    end
  end
end
