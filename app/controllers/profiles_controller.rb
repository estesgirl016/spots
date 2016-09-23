class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @spots = Spot.where(user_id: @user.id)
    @likes = Like.includes(:spot).where(user_id: @user.id)
    @comments = Comment.includes(:spot).where(user_id: @user.id).order(created_at: :desc)
  end
end


# PROFILE NEEDS
# users spots
# users likes
# users comments
# user albums for hike
