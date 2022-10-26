class AddFavouriteToContacts < ActiveRecord::Migration[7.0]
  def change
    change_column :contatcs, :favourite, :integer 
  end
end
