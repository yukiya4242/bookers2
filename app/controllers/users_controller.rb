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

  def update
   @user = User.find(params[:id])
   if @user.update(user_params)
    redirect_to user_path(@user)
   else
    render 'edit'
   end
  end
end