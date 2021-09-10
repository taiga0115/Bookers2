class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
      @books = Book.all
       @userId = current_user.id
    @users = User.all
  end


   def show
       @user = User.find(params[:id])
        @book = Book.all
   end


   def new
     @book = Book.new
   end

   def create
       flash[:notice] = "Book was successfully updated."
        @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if  @book.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
   end




  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
