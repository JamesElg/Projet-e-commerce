class CreateJoinOrderToCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :join_order_to_carts do |t|
    t.belongs_to :item, index: true
    t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
