class ContactsPhoneToBigint < ActiveRecord::Migration[7.0]
  def change
    change_column :contacts, :phone, :bigint
  end
end
