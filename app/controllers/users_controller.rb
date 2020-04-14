class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :destroy]

  def index
    @from = params[:from]
    if @from == 'header'
       @user = current_user
       @users = User.all
    elsif @from == 'followings'
       @user = User.find(params[:user_id])
       @users = @user.followings
    else @from == 'followers'
      @user = User.find(params[:user_id])
      @users = @user.followers
    end
  end

  def show
    @user = User.find(params[:id])
    @plant = Plant.new
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user)
    flash[:success] = '会員情報が更新されました！'
    else
      flash[:danger] = 'お名前は1文字以上20文字以内にしてください。'
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to homes_top_path
    flash[:info] = '退会処理は正常に行われました。ご利用ありがとうございました。'
  end

  private
  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :profile_img_id)
  end
end
