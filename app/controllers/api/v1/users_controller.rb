module Api
    module V1
      class UsersController < ApplicationController
        def index
          @users = User.all
          render json: @users
        end
  
        def show
          @user = User.includes(:products, :orders).find(params[:id])
          render json: @user, include: { products: {}, orders: {} }
        rescue ActiveRecord::RecordNotFound
          render json: { error: 'User not found' }, status: :not_found
        end
      end
    end
  end
  