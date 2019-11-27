class Order < ApplicationRecord

  has_many :join_order_to_carts, dependent: :destroy
  has_many :items, through: :join_order_to_carts
  belongs_to :user

  after_create :thanks_order_send, :admin_order_send

   def thanks_order_send
     OrderMailer.thanks_order_email(self).deliver_now
   end

   def admin_order_send
     User.where(is_admin?: true).find_each do |admin|
       OrderMailer.admin_order_email(self,admin).deliver_now
     end

   end

end
