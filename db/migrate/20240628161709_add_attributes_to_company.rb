class AddAttributesToCompany < ActiveRecord::Migration[6.1]
  def change
    add_column :companies, :status, :string unless column_exists?(:companies, :status)
    add_column :companies, :url, :string unless column_exists?(:companies, :url)
    add_column :companies, :id_copy, :string unless column_exists?(:companies, :id_copy)
    add_column :companies, :password, :string unless column_exists?(:companies, :password)
    add_column :companies, :schedule, :string unless column_exists?(:companies, :schedule)
    add_column :companies, :notes, :text unless column_exists?(:companies, :notes)
  end
end
