class Api::V1::UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)   

    puts(user.email)

    # Handle exception in database
    begin
      user.save
      render :json => "User Created successfully"
    rescue ActiveRecord::RecordNotUnique
      render :json => "Cannot save user"
    rescue ActiveRecord::NotNullViolation
      render :json => "Cannot save user"
    end


      
  
  end

  def update
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
end
