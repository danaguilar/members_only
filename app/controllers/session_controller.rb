class SessionController < ApplicationController
  def new
    get_current_user
  end

  def create
    #Get email and password from params
    user = User.find_by(email: params[:session][:email])
    #See if given email matches email in Users and if given password's digest matches that user's password Digest
    if user && user.authenticate(params[:session][:password])
    ##TRUE: Log in user. Set flash to "User found and password is correct". Render 'new'
      log_in(user)
      flash[:success] = "Success!"
      redirect_to :root
    else
      ##FALSE: set flash to "email/password combination invalid". Render 'new'
      flash[:fail] = "Fail!"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to :root
  end
end
