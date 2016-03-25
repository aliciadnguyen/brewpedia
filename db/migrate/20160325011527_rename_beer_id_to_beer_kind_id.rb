class RenameBeerIdToBeerKindId < ActiveRecord::Migration
  def change
  	rename_column :beer_types, :beer_id, :beer_kind_id
  end
end
