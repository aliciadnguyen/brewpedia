class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :beer_style
      t.text :description
      t.timestamps null: false
    end
  end
end
