class SessionsController < ApplicationController
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: user_params[:email])

    if @user&.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to todos_path(view: "all")
    else
      flash[:alert] = "Invalid email or password"
      render :new, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
