class AddCityAndStateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :state, :string, null: false
    add_column :users, :city, :string, null: false
  end
end
