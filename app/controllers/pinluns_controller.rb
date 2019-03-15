class PinlunsController < ApplicationController
    before_action :correct_user, only: :destroy

    def create
        @pinlun = current_user.pinluns.build(pinlun_params)
        if @pinlun.save
            flash[:success] = "Pinlun success"
            redirect_to root_path
        else
            render 'users/show'
        end
    end

    def destroy
        @pinlun.destroy
        redirect_to root_path
    end

    private
        def pinlun_params
            params.require(:pinlun).permit(:micropost_id, :content)
        end

        def correct_user 
            @pinlun = current_user.pinluns.find_by(id: params[:id])
            redirect_to root_path if @pinlun.nil?
        end
end
