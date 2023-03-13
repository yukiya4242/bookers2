class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @books = Book.all
    @book = Book.new
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
  end


  private
  def book_params
   params.require(:book).permit(:title, :body).merge(user_id: current_user.id)
  end
end
