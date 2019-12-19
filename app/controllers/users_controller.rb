class UsersController < ApplicationController

    skip_before_action :user_from_token, only: [:login, :create]

    def create 
        # byebug
        @user = User.create(username: params[:username], password: params[:password])
        render json: {user: @user, token: create_token(@user)}
    end

    def show
        @user = User.find(user_params)
        render json: @user
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy()
    end

    def auto_login
        render json: user_from_token
    end

    def login
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            render json: {user: UserSerializer.new(user), token: create_token(user)}
        else
            render json: {error: "wrong credentials"}
        end
    end

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end

end
