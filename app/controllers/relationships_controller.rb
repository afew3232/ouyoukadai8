class RelationshipsController < ApplicationController
	def create
		@relationship = Relationship.new(followed_id: params[:followed_id])
		@relationship.follow_id = current_user.id
		if @relationship.followed_id != current_user.id #フォロー先が自分でない
			@relationship.save
			flash[:notice] = "success follow"
		end
		redirect_back(fallback_location: nil)
	end

	def destroy
		relationship = Relationship.find_by(followed_id: params[:id],
											follow_id: current_user.id)
		relationship.delete
		flash[:notice] = "success follow delete"
		redirect_back(fallback_location: nil)
	end

	def follow
		@users = User.all
	end
	def followed
		@users = User.all
	end

end
