class UsersController < ApplicationController
    def new
        @user = User.new()
    end
    def create
        # @user = User.new(username: params[:username], email: params[:email], password: params[:password])
        
        @user = User.new(allowed_post_params)

        if @user.save
            flash[:success] = "Account successfully created"
            redirect_to new_user_path
        else
            flash[:error] = "User creation failed"
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])

        if @user.update(allowed_post_params)
            flash[:success] = "Account successfully updated"
            redirect_to new_user_path
        else
            flash.now[:error] = "User update failed"
        end
    end

    private  
    def allowed_post_params
      params.require(:user).permit(:username,:email,:password)
    end
end
