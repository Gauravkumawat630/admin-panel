module Api
  module V1
    class ProductsController < ApplicationController
      def index
        products = Product.all
        render json: products, status: :ok 

      private

      def product_params
        params.require(:product).permit(:name, :price)
      end
    end
  end
end
