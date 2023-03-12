class UsersController < ApplicationController
 def show
  @user = User.find(params[:id])
  @books = @user.books

  if @books.any?
    @books = @books.page(params[:page])
  end
 end

  def edit
  end

  def view
  end
end