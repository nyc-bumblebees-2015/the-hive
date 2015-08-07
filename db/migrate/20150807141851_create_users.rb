class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false, unique: true, index: true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false, unique: true
      t.string :password_digest, null: false
      t.text :bio, default: nil
      t.string :zip_code, null: false
      t.float :longitude, null: false
      t.float :latitude, null: false
      t.string :github_link, default: nil
      t.string :website_link, default: nil

      t.timestamps null: false
    end
  end
end
