class Order < ApplicationRecord

  after_create :thanks_order_send

   def thanks_order_send
     OrderMailer.thanks_order_email(self).deliver_now
   end

end
