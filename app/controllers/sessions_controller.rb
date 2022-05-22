class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to tasks_path #root_urlではエラーが出るので変更した
    else
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_url #root_urlではエラーが出る
  end
end
