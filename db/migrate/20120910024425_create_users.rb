class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_salt
      t.string :password_hash
      t.string :title
      t.string :telephone
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :country
      t.string :postal_code
      t.integer :company_id

      t.timestamps
    end
  end
end
