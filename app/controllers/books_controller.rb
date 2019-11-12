class BooksController < ApplicationController
  def index
    #記事を全件取得
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
  	@book = Book.new
  end

  def create
    #ストロングパラメーターを使用
     @books = Book.all
  	@book = Book.new(book_params)
   #  #DBリストへ保存する
  	if @book.save
    flash[:success] = 'Books was successfully created.'
    @msg = "Books was succesfully created."
    #  #詳細へ移行
    redirect_to book_path(@book)
  else
    render :index
  end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    flash[:update] = 'Books was successfully updated.'
    redirect_to book_path(book)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
