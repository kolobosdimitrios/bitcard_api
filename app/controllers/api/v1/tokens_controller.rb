class Api::V1::TokensController < ApplicationController

  def create
    row = Token.where(user_id: params[:user_id]).first
    if row #if exists then update
      if (Time.now - row.created_at) < 30.minutes
        update row
      else
        puts "no need for update right now aborting..."
        render_JSON 1, "token created successfully", {
          "token": row.token,
          "created_at": row.created_at,
          "updated_at": row.updated_at
        }
      end
    else
      token = Token.create()
      token.user_id = params[:user_id]
      token.token = generate_token
      token.created_at = Time.now
      token.updated_at = Time.now
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
