class BookCommentsController < ApplicationController
		def create
		@book_comment = BookComment.new(book_comment_params)
		if @book_comment.save
			@book = Book.find(@book_comment.book_id)
			@users = User.all
			@book_comments = BookComment.all
			render 'book_comments/comment_all'
			#redirect_back(fallback_location: nil)
		else
			@book_new = Book.new
			@book = Book.find(@book_comment.book_id)
			@user = User.find(@book.user_id)
			@users = User.all
			@book_comments = BookComment.all
			render 'books/show'
		end
	end
	def update
	end
	def destroy
		@book_comment = BookComment.find(params[:id])
		@book_comment.delete
		@book = Book.find(@book_comment.book_id)
		@users = User.all
		@book_comments = BookComment.all
		render :comment_all
		#redirect_back(fallback_location: nil)
	end

	private
	def book_comment_params
		params.require(:book_comment).permit(:body,:book_id,:user_id)
	end
end
