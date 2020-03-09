module BooksHelper


  def favorited?(favorite_user_id,favorite_book_id)
 	  favorites = Favorite.all
 	  favorites.each do |l|
 	  if favorite_user_id == l.user_id && favorite_book_id == l.book_id
 			return true
     	end
  	end
    return false
  end

  def favorited_count(favorited_book_id)
    favorite = Favorite.all
    count = 0
    favorite.each do |l|
      if l.book_id == favorited_book_id
        count = count + 1
      end
    end
    return count
  end

  def discover_book_comment(look_book_id,book_comment_id)
      if look_book_id == book_comment_id
        return true
      end
    return false
  end

  def book_comment_count(look_book_id)
    book_comments = BookComment.all
    count = 0
    book_comments.each do |c|
      if look_book_id == c.book_id
        count += 1
      end
    end
    return count
  end

end
