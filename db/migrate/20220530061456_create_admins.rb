class CreateAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :admins do |t|
      t.string :email
      t.string :user_name
      t.string :password_digest

      t.timestamps
    end
  end
end
