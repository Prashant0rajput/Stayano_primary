class RemoveColumnsFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :string, :string
    remove_column :users, :cover_pic, :string
  end
end