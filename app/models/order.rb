class Order < ApplicationRecord

  has_many :join_order_to_carts, dependent: :destroy
  has_many :items, through: :join_order_to_carts
  belongs_to :user

  after_create :join_order_to_carts, :thanks_order_send, :admin_order_send, :empty_cart

   def thanks_order_send
     OrderMailer.thanks_order_email(self).deliver_now
   end

   def admin_order_send
     User.where(is_admin?: true).find_each do |admin|
       OrderMailer.admin_order_email(self,admin).deliver_now
     end
   end

   def join_order_to_carts
     Cart.where(user_id: self.user_id).each do |cart|
       JoinOrderToCart.create(item_id: Item.find(cart.item_id.to_i).id  ,order_id: self.id )
      end
    end

  def empty_cart
    Cart.where(user_id: self.user_id).destroy_all
  end

end
