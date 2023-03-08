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
    @user = User.find(params[:id])
    if @user.update(user_params)
      # handle a successful update, such as redirecting to a show page
      successResponse
    else
      # handle a failed update, such as rendering the edit page again
      errorResponse [], "user with the given id not found"
    end
  end

  def update_user_points
    @user = User.find(update_user_points_params[:id])
    if @user
      current_points = @user.points
      puts "user current points : " + current_points.to_s
      new_points = current_points + update_user_points_params[:points]
      puts "user new pooints "
      new_coupons_number = new_points.div(300) 
      remaining_points = new_points%300
      #create new coupons
      # coupons = []
      for index in 1..new_coupons_number
        c = Coupon.create(
          value: 3,
          code: SecureRandom.alphanumeric(16),
          redeemed: 0,
          user_id: update_user_points_params[:id]
        )
        c.save()
        # coupons << c
      end
      @user.points = remaining_points
      @user.remaining_points = 300 - @user.points
      if @user.save
        successResponse @user
      else
        errorResponse [], "cannot update user points"
      end
    else
      errorResponse [], "user with given id not found"
    end
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
        puts session[:user_id]
        redirect_to action: "show", id: user.id
      end 
    rescue ActiveRecord::RecordNotFound
      errorResponse [], "user with the given id not found"
    end
  end

  def logout
    session[:user_key] = nil
    successResponse
    puts "session destroyed!"  
  end

  def user_params
    params.require(:user).permit(:id, :name, :surname, :username, :user_key, :date_of_birth, :address, :email, :image)
  end

  def user_key_param
    params.permit(:user_key)
  end

  def update_user_points_params
    params.permit(:id, :points)
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
