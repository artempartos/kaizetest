class RenameColumnPasswordInUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.rename :password, :password_digest
      t.index :email, :unique => true
    end
  end
end
