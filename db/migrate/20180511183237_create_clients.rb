class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :company_name
      t.string :address
      t.string :zipcode
      t.string :city
      t.string :country
      t.string :phonenumber
      t.string :email

      t.timestamps
    end
  end
end
