class Api::V1::UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)   
    # Handle exception in database
    begin
      if @user && @user.save
        successResponse
        session[:user_id] = @user.user_id  
      end
    rescue ActiveRecord::RecordNotUnique
      errorResponse [], "user already exists"
    rescue ActiveRecord::NotNullViolation
      errorResponse [], "null values are not permitted"
    end
  
  end

  def update
  end

  def login
    begin
      @user = User.find_by!(user_id_param)
      if @user
        session[:user_id] = @user.user_id  
        puts "session created"
        successResponse @user
      end 
    rescue ActiveRecord::RecordNotFound
      errorResponse [], "user with the given id not found"
    end
  end

  def edit
  end

  def destroy
     
  end

  def logout
    puts session[:user_id]
    session[:user_id] = nil
    successResponse
    puts "session destroyed!"  
  end

  def index
  end

  def show
  end

  def user_params
    params.require(:user).permit(:name, :surname, :username, :user_id, :date_of_birth, :address, :email)
  end

  def user_id_param
    params.permit(:user_id)
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
