class CreateJoinTableCompaniesTags < ActiveRecord::Migration[6.1]
  def change
    create_join_table :companies, :tags do |t|
      t.index :company_id
      t.index :tag_id
    end
  end
end