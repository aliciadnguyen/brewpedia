class AddMoreFieldsToBeerTable < ActiveRecord::Migration
  def change
  	add_column :beer_types, :name, :string
  	add_column :beer_types, :review, :text
  end
end
