class RenameBeersTableToBeerKinds < ActiveRecord::Migration
  def change
  	rename_table :beers, :beer_kinds
  end
end
