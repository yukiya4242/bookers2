class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.all.order(created: :desc)

  end




  def create
    book = Book.new(book_params)
    book.save
    redirect_to book
  end


  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end


  private
  def book_params
   params.require(:book).permit(:title, :body).merge(user_id: current_user.id)
  end
end
