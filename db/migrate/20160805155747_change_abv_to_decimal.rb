class ChangeAbvToDecimal < ActiveRecord::Migration
  def change
  	change_column :beers, :abv, :decimal, :precision => 2
  end
end
