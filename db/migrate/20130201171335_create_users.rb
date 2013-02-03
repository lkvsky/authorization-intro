class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :session_token
      t.string :password_digest

      t.timestamp
    end
  end
end
