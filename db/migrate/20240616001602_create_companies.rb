class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :industry
      t.string :status
      t.string :url
      t.string :id_copy
      t.string :password
      t.string :schedule
      t.text :notes

      t.timestamps
    end
  end
end

