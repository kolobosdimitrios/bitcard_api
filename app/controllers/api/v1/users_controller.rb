class Api::V1::UsersController < ApplicationController
  def new
  end

  def index
    @users = User.all
    if @users 
      successResponse @users
    else
      errorResponse
    end
  end

  def show
    @user = User.find(params[:id])
    puts "show found user"
    if @user
      successResponse @user
    else
      errorResponse
    end
  end

  def create
    @user = User.new(user_params)   
    # Handle exception in database
    begin
      if @user && @user.save
        successResponse @user
        session[:user_key] = @user.user_key  
      end
    rescue ActiveRecord::RecordNotUnique
      errorResponse [], "user already exists"
    rescue ActiveRecord::NotNullViolation
      errorResponse [], "null values are not permitted"
    end
  
  end

  def update
  end

  def destroy
    @user = User.find(params[:id])
     @user.destroy
     successResponse "user destroyed!"
  end

  

  def login
    begin
      user = User.find_by user_key: params[:user_key]
      if user
        puts "user found"
        session[:user_id] = user.id   
        puts "session created"
        redirect_to action: "show", id: user.id
      end 
    rescue ActiveRecord::RecordNotFound
      errorResponse [], "user with the given id not found"
    end
  end

  def logout
    puts session[:user_key]
    session[:user_key] = nil
    successResponse
    puts "session destroyed!"  
  end

  def user_params
    params.require(:user).permit(:name, :surname, :username, :user_key, :date_of_birth, :address, :email)
  end

  def user_key_param
    params.permit(:user_key)
  end

  def errorResponse(data = [], description = "error", status_code = -1)
    render json: {
      "status_code": status_code,
      "description": description,
      "data": data
    }
  end

  def successResponse(data = [])
    render json: {
      "status_code": 1,
      "description": "Success",
      "data": data
    }
  end
end
