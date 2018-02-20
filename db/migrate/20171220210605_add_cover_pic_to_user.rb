class AddCoverPicToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :cover_pic, :string
  end
end
