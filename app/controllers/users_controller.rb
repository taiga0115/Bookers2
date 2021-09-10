class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
     @books = Book.all
     @book =Book.all
  end

def create
       flash[:notice] = "Book was successfully updated." 
        @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if  @book.save
      redirect_to books_path(@book.id)
    else
      render :show
    end
end 

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def index
     @userId = current_user.id
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
