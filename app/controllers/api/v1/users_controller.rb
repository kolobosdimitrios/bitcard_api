class Api::V1::UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)   

    puts(user.email)

    # Handle exception in database
    begin
      user.save
      successResponse
    rescue ActiveRecord::RecordNotUnique
      errorResponse
    rescue ActiveRecord::NotNullViolation
      errorResponse
    end
  
  end

  def update
  end

  def show_with_id
    puts user_id_param
    begin
      user = User.find_by!(user_id_param)
      successResponse user
    rescue ActiveRecord::RecordNotFound
      errorResponse
    end
  end

  def edit
  end

  def destroy
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

  def errorResponse(data = [])
    render json: {
      "status_code": -1,
      "description": "Error while saving-creating user",
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
