class SpotsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  def index
    @spots = Spot.all
  end

  def show
    @spot = Spot.find(params[:id])
    @comments = @spot.comments.includes(:user).order(created_at: :desc)
    @comment = Comment.new
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.user_id = current_user.id
    if @spot.save
      redirect_to spot_path(@spot)
    else
      render :new
    end
  end

  def edit
    @spot = Spot.find(params[:id])
  end

  def update
    @spot = Spot.find(params[:id])
    if @spot.update(spot_params)
      redirect_to spot_path(@spot)
    else
      render :edit
    end
  end

  def destroy
    @spot = Spot.find(params[:id])
    if @spot.destroy
      redirect_to spots_path
    else
      redirect_to spot_path(@spot)
    end
  end

  def like
    @spot = Spot.find(params[:id])
    likes = @spot.likes
    already_liked = false
    likes.each do |like|
     if like.user_id == current_user.id
       already_liked = like
       like.destroy
     end
    end

    if already_liked == false
      like = Like.new
      like.spot_id = @spot.id
      like.user_id = current_user.id
      if like.save
        redirect_to spot_path(@spot)
      end
    else
      # TODO flash like was removed
      redirect_to spot_path(@spot)
    end
  end

  def new_comment
    @spot = Spot.find(params[:id])
    @comment = @spot.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to spot_path(@spot)
    else
      redirect_to spot_path(@spot)
    end
  end

  def delete_comment
    @spot = Spot.find(params[:spot_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to spot_path(@spot)
  end

  private

  def spot_params
    params.require(:spot).permit(:name, :description)
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
