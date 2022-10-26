class UseidToPictures < ActiveRecord::Migration[7.0]
  add_column :pictures, :user_id, :integer

  def change
  end
end
