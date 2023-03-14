class UsersController < ApplicationController
 def show
  @user = User.find(params[:id])
  @books = @user.books
  @book = Book.new
 end

  def edit
   @user = User.find(params[:id])

  end

  def create

  end

  def index
   @users = User.all
   @user = User.new
   @book = current_user
  end

 #ユーザー情報の取得
 #ユーザーのアップデート
 #ユーザーの詳細ページへの

  def update
   @user = User.find(params[:id])
   if @user.update(user_params)
    redirect_to user_path(@user)
   else
    render 'edit'
   end
  end

  private
  def user_params
   params.require(:user).permit(:title, :body, :image)
  end

end