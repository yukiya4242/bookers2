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

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book
    else
      'edit'
    end
  end





  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book)
    end
  end


  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end


  private
  def book_params
   params.require(:book).permit(:title, :opinion, :image)
  end
end

=begin
1. フォームからデータを送る
2. createアクション
  2-1. ルーティングを作成
  2-2. データを受け取る
  2-3. 保存するデータのuser_idにログインしているuserのidを追加する
  2-4. 保存して、成功した場合は、showにリダイレクトさせる
  2-5. エラー文等々
=end