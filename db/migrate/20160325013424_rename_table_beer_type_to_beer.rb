class RenameTableBeerTypeToBeer < ActiveRecord::Migration
  def change
  	rename_table :beer_types, :beers
  end
end
