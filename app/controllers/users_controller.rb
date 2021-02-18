class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def show 
        @user = User.find_by(id: params[:id])
    end

    def new
        @user = User.new
    end 

    def create
        @user = User.new(user_params)
        @user.email.downcase!
        
        if @user.save
          flash[:notice] = "Account created successfully!"
          redirect_to user_path(@user)
        else
          flash.now.alert = "Oops, couldn't create account. Please make sure you are using a valid username, email and password and try again."
          render :new
        end
      end
    
    private
    
    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

end
