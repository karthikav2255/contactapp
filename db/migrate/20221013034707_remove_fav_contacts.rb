class RemoveFavContacts < ActiveRecord::Migration[7.0]
  def change
    remove_column :contacts, :favourite
  end
end
