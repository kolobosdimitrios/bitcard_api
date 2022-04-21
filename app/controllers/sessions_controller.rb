class SessionsController < ApplicationController


    def create 
    
        @user = User.find_by(username: params[:username])
        #authnticate user credentials
        if !!@user && @user.authenticate(params[:password])
            #set session and redirect on success
            session[:user_id] = @user.id
            render json: {
                status_code: 1,
                description: "Login Successfull",
                data: "some_key_here"                
            }
        else
            #error message on fail
            render json: {
                status_code: -1,
                description: "Unable to Login",
                data: ""                
            }
    end
end