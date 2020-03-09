module RelationshipsHelper
	def follows?(followed_user_id)
		follow = Relationship.all
		follow.each do |f|
			if current_user.id == f.follow_id && followed_user_id == f.followed_id
				return true
			end
		end
		return false
	end

	def follow_count(user_id)
		relationship = Relationship.all
		count = 0
		relationship.each do |r|
			if user_id == r.follow_id
				count = count + 1
			end
		end
		return count
	end

	def followed_count(user_id)
		relationship = Relationship.all
		count = 0
		relationship.each do |r|
			count += 1 if user_id == r.followed_id
		end
		return count
	end

	def follow_me?(user_id)
		relationship = Relationship.all
		relationship.each do |r|
			return true if r.followed_id == user_id && r.follow_id == current_user.id
		end
		return false
	end

	def followed_me?(user_id)
		relationship = Relationship.all
		relationship.each do |r|
			return true if r.followed_id == current_user.id && r.follow_id == user_id
		end
		return false
	end

end
