class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
<<<<<<< HEAD
    @order = Order.new(user_id: current_user.id, address: "21 Rue Richard Lenoir", statut_id: 1 )
=======
    @order = Order.new(order_params)
    join_order_to_carts
    empty_cart
>>>>>>> development

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
      @session_id = stripe.id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:statut_id, :address, :user_id)
    end

    private

    def stripe
      Stripe.api_key = 'sk_test_21TiEwcaDyLdlIZ5KpPKCh9o00TpyciS6q'

          session = Stripe::Checkout::Session.create(

      payment_method_types: ['card'],
      line_items: [{
        name: 'Bryan Ajaro Gallery',
        description: 'Comfortable cotton t-shirt',
        images: ['https://example.com/t-shirt.png'],
        amount: 500,
        currency: 'eur',
        quantity: 1,
      }],
      success_url: 'https://projet-e-commerce.herokuapp.com/',
      cancel_url: 'https://example.com/cancel',
    )
    return session
    end

end
