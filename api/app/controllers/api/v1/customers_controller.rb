class Api::V1::CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :update, :destroy]

  def index
    @customers = Customer.all.order(created_at: :desc)
  end

  def create
    @customer = Customer.new customer_params
    @customer.save!
    render json: @customer, status: :created

  rescue StandardError => e
    render json: { message: 'Something went wrong', error: e.message }, status: :unprocessable_entity
  end

  def update
    @customer.update! customer_params
    render json: @customer, status: :ok

  rescue StandardError => e
    render json: { message: 'Something went wrong', error: e.message }, status: :unprocessable_entity
  end

  def destroy
    @customer.destroy
    head :no_content
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit :name, :address, :phone, :email, :nationality
  end
end
