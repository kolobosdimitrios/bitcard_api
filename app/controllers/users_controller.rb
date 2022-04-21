class UsersController < ApplicationController


    def index
    end

    def show 
        @user = User.find(params[:id])
        if !!@user
            render json: {
                id: @user.id,
                name: @user.name,
                surname: @user.surname,
                username: @user.username,
                password: @user.password,
                date: @user.date_of_birth,
                address: @user.address,
                email: @user.email
                
            }
        end
    end

    def

    def new
        @user = User.new
    end

    def create

        user = User.new(user_params)

        if user.save
            session[:user_id] = user.id
        else
        end

    end

    def user_params
        params.require(:user).permit(
            :id, :username, :name, :surname, :password, :date_of_birth, :address, :email
        )
    end
end
