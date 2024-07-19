class AddConfirmableToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    add_column :users, :unconfirmed_email, :string # 既存のemailが変更される場合のみ使用

    add_index :users, :confirmation_token, unique: true
  end
end