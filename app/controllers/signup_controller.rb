class SignupController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save # Save the user to the database
      session[:user_id] = @user.id # Log in the user
      redirect_to todos_path # Redirect to the todos page
    else
      render :new # Render the new view
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :user_name)
  end
end
