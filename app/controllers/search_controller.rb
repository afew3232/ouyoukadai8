class SearchController < ApplicationController
	def search
		if params[:target] == "User"
			@users = search_user(params[:word],params[:style])
			@word = params[:word]
			render "search/search_user"
		elsif params[:target] == "Book"
			@books = search_book(params[:word],params[:style])
			@word = params[:word]
			render "search/search_book"
		end
	end

	def search_user(word,style)
		case style
			when "部分一致" then
				return User.all unless word
				User.where(["name LIKE ?", "%#{word}%"])
			when "完全一致" then
				return User.all unless word
				User.where(["name LIKE ?", "#{word}"])
			when "前方一致" then
				return User.all unless word
				User.where(["name LIKE ?", "#{word}%"])
			when "後方一致" then
				return User.all unless word
				User.where(["name LIKE ?", "%#{word}"])
			else
		end
	end

	def search_book(word,style)
		case style
			when "部分一致" then
				return Book.all unless word
				Book.where(["title LIKE ?", "%#{word}%"])
			when "完全一致" then
				return Book.all unless word
				Book.where(["title LIKE ?", "#{word}"])
			when "前方一致" then
				return Book.all unless word
				Book.where(["title LIKE ?", "#{word}%"])
			when "後方一致" then
				return Book.all unless word
				Book.where(["title LIKE ?", "%#{word}"])
			else
		end
	end

end
