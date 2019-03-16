class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def create
    user = User.find(params[:follow_id])
    current_user.follow(user)
    flash[:success] = 'ユーザーをフォローしました。'
    redirect_to user
  end

  def destroy
    user = User.find(params[:follow_id])
    current_user.unfollow(user)
    flash[:success] = 'ユーザーのフォローを解除しました。'
    redirect_to user
  end

 def counts(user)
    @count_microposts = user.microposts.count
    @count_followings = user.followings.count
    @count_followers = user.followers.count
 end


end