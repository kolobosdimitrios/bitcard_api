class Api::V1::TokensController < ApplicationController

  def create
    row = Token.where(user_id: params[:user_id]).first
    if row #if exists then update
      update row
    else
      token = Token.create()
      token.user_id = params[:user_id]
      token.token = generate_token
      token.created_at = Time.now
      token.updated_at = Time.now
      puts "token is"
      puts token.user_id
      puts token.token
      puts token.created_at
      puts token.updated_at
      # begin
      if token.save
        puts "token_saved"
        render_JSON 1, "token created successfully", {
          "token": token.token,
          "created_at": token.created_at,
          "updated_at": token.updated_at
        }
      end 
    end
  end

  def index
  end

  def update (token)#update users token
    puts "token exists updating..."
    new_token = generate_token
    token.token = new_token
    token.updated_at = Time.now
    if token.save
      render_JSON 1, "token updated successfully", {
        "token": token.token,
        "created_at": token.created_at,
        "updated_at": token.updated_at
      } #return the token
    else
      render_JSON -1, "token cannot be updated", [] #return error 
    end
  end

  def fetch_user_id
    params.permit[:user_id]
  end

  def render_JSON(status_code = 1, description = "", data = [])
    render json: {
      "status_code": status_code,
      "description": description,
      "data": data
    }
  end

  def generate_token
    t = SecureRandom.hex(256)
    return t
  end


end
