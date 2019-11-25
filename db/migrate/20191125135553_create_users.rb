class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :phone
      t.string :stripe_customer_id
      t.timestamps
    end
  end
end
