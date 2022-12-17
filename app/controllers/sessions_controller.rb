class SessionsController < ApplicationController

    def new 
    end

    #create a new session
    def create 
        user = User.find_by_user_id(requiere_user_id)
        if user
            session[:user_id] = user.id
        else
            render :new
        end
    end
    
     
    #destroy session
    def destroy
        session[:user_id] = nil   
    end

    def requiere_user_id
        params.require(:user_id)
    end
end