class LikesController < ApplicationController
	def create
		binding.pry
    @spot = Spot.find(params[:id])
    already_liked = @spot.already_liked?(current_user)
		if already_liked == false
			like
    else
      unlike
    end
		redirect_to :back
  end

  private
  def like_params
  	params[:spot_id]
  end

  def unlike
  	@spot = Spot.find(params[:id])
  	flash[:success] = "Spot Unliked!"
  end

  def like
  	binding.pry
    like = Like.new(like_params)
    like.spot_id = @spot.id
    like.user_id = current_user.id
    if like.save
      flash[:success] = "You Liked This Spot!"
    end
  end
end
