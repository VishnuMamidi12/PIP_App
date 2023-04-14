class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :mobile_no
      t.string :password
      t.string :confirm_password

      t.timestamps
    end
  end
end
