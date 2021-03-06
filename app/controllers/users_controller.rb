class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:sort] == 'all_users'
       @user = current_user
       @users_all = User.all
       @users = User.page(params[:page])
    elsif params[:sort] == 'followings'
       @user = User.find(params[:user_id])
       @users_all = @user.followings
       @users = @user.followings.page(params[:page])
    else params[:sort] == 'followers'
      @user = User.find(params[:user_id])
      @users_all = @user.followers
      @users = @user.followers.page(params[:page])
    end
  end

  def show
    @user = User.find(params[:id])
    @plant = Plant.new
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_back(fallback_location: root_path)
      flash[:danger] = 'お探しのページにアクセスできませんでした。'
    end
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
    @user = current_user
    if @user.destroy
      redirect_to homes_top_path
      flash[:info] = '退会処理は正常に行われました。ご利用ありがとうございました。'
    else
      redirect_back(fallback_location: root_path)
      flash[:danger] = '退会の処理に失敗しました。'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :introduction, :profile_img)
  end
end
