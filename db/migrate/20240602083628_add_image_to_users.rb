class AddImageToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :image, :string
    add_column :users, :remove_image, :boolean, default: false
  end
end