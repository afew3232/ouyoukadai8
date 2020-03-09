class FavoritesController < ApplicationController
	def create
		Favorite.create(book_id: params[:id],user_id: current_user.id)
		@book = Book.find(params[:id])
		@call = params[:call]
		render 'books/book_row'
		#redirect_back(fallback_location: nil)
	end

	def destroy
		favorite = Favorite.find_by(book_id: params[:id],user_id: params[:user_id])
		favorite.delete
		@book = Book.find(params[:id])
		@call = params[:call]
		render 'books/book_row'
		#redirect_back(fallback_location: nil)
	end
end
