class AddStatusToOrder < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :statut, foreign_key: true
    remove_column :orders, :status, :string
  end
end
