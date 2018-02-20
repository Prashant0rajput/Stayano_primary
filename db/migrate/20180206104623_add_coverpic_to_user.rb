class AddCoverpicToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :coverpic, :string
    add_column :users, :string, :string
  end
end
