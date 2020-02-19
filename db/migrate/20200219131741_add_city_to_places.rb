class AddCityToPlaces < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :city, :text
  end
end
