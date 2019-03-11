class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(email: params[:session][:email])
        if @user && @user.authenticate(params[:session][:password])
            flash[:success] = " hello! Welcome ro my app "
            sign_in @user
            redirect_to @user
        else
            flash.now[:error] = "Passwrod / Eamil error"
            render 'new'
        end
    end

    def destroy
        sign_out 
        flash[:success] = "Success Quit"
        redirect_to root_path
    end
end
