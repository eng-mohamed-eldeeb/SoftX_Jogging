class UsersController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource

    def index
        @users = User.all
        render json: @users
    end
    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user, status: :created
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end
    
    # users/show/:id
    def show
        @user = User.find(params[:id])
        render json: @user.as_json(only: [:email, :role, :id], include: :jogging_times)
    end
    
    def update
        # users/create/:id
        @user = User.find(params[:id])
        if @user.update(user_params)
            render json: @user, status: :ok
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @user = User.find(params[:id])
        if @user.destroy
            render json: @user, status: :ok
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :role)
    end
    
end
