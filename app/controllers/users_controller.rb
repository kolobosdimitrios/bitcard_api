class UsersController < ApplicationController


    def index
        
    end

    def show 
        @user = User.find(params[:id])
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

    def

    def new
    end

    def create

        user = User.new(
            name: params[:name],
            surname: params[:surname],
            username: params[:username],
            password: params[:password],
            date_of_birth: params[:date_of_birth],
            address: params[:address],
            email: params[:email]
        )

        if user.save
            session[:user_id] = user.id
            flash[:success] = "Successfully creates user!"
        else
            flash[:success] = "Cannot create user"
        end

    end

end
