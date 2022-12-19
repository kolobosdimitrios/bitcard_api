class Api::V1::TokensController < ApplicationController

  def new
  end

  def create
    row = Token.find_by!(fetch_user_id)
    if row
      render_JSON -2, "token for user already exists", [] #ignore and use current token
    else
      token = Token.create(user_id: user_id, token: generate_token)
      if token.save
        render_JSON 1, "token created successfully", new_token.token #return the token
      else
        render_JSON -1, "token cannot be created", [] #return error 
      end
    end
  end

  def update #update users token
    current_token_row = Token.find_by!(fetch_user_id)
    if current_token
      puts "token exists updating..."
      new_token = generate_token
      current_token_row.token = new_token
      if current_token_row.save
        render_JSON 1, "token updated successfully", current_token_row.token #return the token
      else
        render_JSON -1, "token cannot be updated", [] #return error 
      end
    else
      render_JSON -2, "token for user not exists", [] #ignore and use current token
    end

  end

  def index
    token = Token.find_by!(fetch_user_id)
    if token
      render_JSON 1, "token exists", token
    else
      render_JSON -1, "token for given user id not found", []
    end
  end

  def destroy
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
    puts t
    return t
  end
end
