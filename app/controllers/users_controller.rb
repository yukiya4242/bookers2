class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?





 def show
  @user = User.find(params[:id])
  @books = @user.books
  @book = Book.new
  @book = Book.find(params[:book_id]) if params[:book_id]
  @users = User.all
 end

  def edit
   @user = User.find(params[:id])
   if @user != current_user
    redirect_to edit_user_path
   end

  end












def create
@user = User.new(user_params)
@user.user_id = current_user.id
if @user.save
log_in @user
flash[:notice] = "Welcome! You have signed up successfully."
redirect_to book_path(@book.id), notice: 'Profile updated successfully'
else
flash.now[:error] = "Error: failed to sign up."
render 'edit'
end

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
   redirect_to user_path(@user.id)
   flash[:success] = "You have updated user successfully."
   else
   flash.now[:error] = "Error: failed to update user."
   render :edit
   end
  end

  private
  def user_params
   params.require(:user).permit(:name, :profile_image, :introduction)
  end

end


  #def update
   #@user = User.find(params[:id])
   #if @user.update(user_params)
    #redirect_to user_path(@user.id)
   #else
    #render 'edit'
   #end
  #end