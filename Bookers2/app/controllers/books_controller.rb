class BooksController < ApplicationController
  def index
  	@books = Book.all
  	@book = Book.new
  end

  def show
  	@book = Book.find(params[:id])
  	#puts 'params[:id] → ６とか レコードの:idが入る
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def root
  end

  def create
  	book = Book.new(book_params)
  	book.save
  	#puts params[:id] nilが返ってくる? URLに:idがないルートを通ると
  	#                 nilが返ってくる?
  	#rake routesだと show edit update destroyのみ
  	#puts book.id 新しく作成したbookのidが入ってる
  	#route変更でも対応できる？？
  	flash[:notice] = "Book was successfully created"
  	redirect_to book_path(book.id)
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	flash[:notice] = "Book was successfully destroyed."
  	redirect_to books_path
  end

  def update
  	book = Book.find(params[:id])
  	book.update(book_params)
  	flash[:notice] = "Book was successfully updated"
  	redirect_to book_path(params[:id])
  end


  private
  #ストロング
  def book_params
  	#require:必要とする ⇒ permit:許可する
  	params.require(:book).permit(:title, :body)
  end

end
