class BooksController < ApplicationController

  def top
  end


  def show
  	 @book = Book.find(params[:id])
  end

  def index
  	  @books = Book.all
	    @book = Book.new

  end

  def new
  	 @books = Book.all
	   @book = Book.new

  end

  def create
  	  #ストロングパラメーターを使用
  	  book = Book.new(book_params)
  	  #DBへ保存する
  	  book.save
  	  #トップ画面へリダイレクト
      flash[:notice] = "Book was successfully created."
  	  redirect_to book_path(book.id)
  end

  def edit
  	  @book = Book.find(params[:id])
  end

  def update
  	  book = Book.find(params[:id])
  	  book.update(book_params)
      flash[:notice] = "Book was successfully updated."
  	  redirect_to book_path(book)
  end

  def destroy
  	  book = Book.find(params[:id])
  	  book.destroy
      #削除した後戻る場所が無くなる為、books_pathにする。
  	  redirect_to books_path
  end

  private

  def book_params
  	  params.require(:book).permit(:title, :body)
  end

end
