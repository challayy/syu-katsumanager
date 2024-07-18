class AddCompanyIdToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :company_id, :integer
    add_index :comments, :company_id
  end
end