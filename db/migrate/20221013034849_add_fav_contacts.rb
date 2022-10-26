class AddFavContacts < ActiveRecord::Migration[7.0]
  def change
    add_column :contacts, :favourite, :integer
  end
end
