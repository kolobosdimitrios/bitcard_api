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

        user = User.where(id: user_params[:id]).first
        if user.nil?

            new_user = User.new(user_params)
            if new_user.save
                render json:{
                    "status_code": 1,
                    "description": "user created!",
                    "data": new_user
                }
            end
        else
            render json:{
                "status_code": 2,
                "description": "user already exists",
                "data": user
            }
        end

    end

    def user_params
        params.require(:user).permit(
            :id, :username, :name, :surname, :password, :date_of_birth, :address, :email
        )
    end
end
