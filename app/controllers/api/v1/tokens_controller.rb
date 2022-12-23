class Api::V1::TokensController < ApplicationController

  def get
    row = Token.where(user_id: params[:user_id]).last
    if row #if exists then update
      if (Time.now - row.updated_at) > 30.minutes
        create_new row
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

  def create_new (token)#create new users token
    puts "token exists updating..."
    new_token = Token.create()
    new_token.user_id = token.user_id
    new_token.token = generate_token
    if new_token.save
      render_JSON 1, "token updated successfully", {
        "token": new_token.token,
        "created_at": new_token.created_at,
        "updated_at": new_token.updated_at
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
