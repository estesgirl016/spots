class SpotsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  def index
    @spots = Spot.page(params[:page]) #.per(3)
  end

  def show
    @spot = Spot.includes(:user).find(params[:id])
    @comments = @spot.comments.includes(:user).order(created_at: :desc)
    @comment = Comment.new
    @spot_picture = @spot.spot_pictures.new
  end

  def new
    @spot = Spot.new
    @address = Address.new
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.user_id = current_user.id
    @address = @spot.address = Address.new(address_params)
    if @spot.save && @address.save

      flash[:notice] = "Spot Saved Successfully!"
      redirect_to spot_path(@spot)
    else
      flash[:alert] = "Spot Not Saved! " + @spot.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @spot = Spot.find(params[:id])
    @address = @spot.address
    @spot_picture = @spot.spot_pictures.first
  end

  def update
    @spot = Spot.find(params[:id])
    @spot.address.update(address_params)
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
    already_liked = @spot.already_liked?(current_user)
    if already_liked == false
      like = Like.new
      like.spot_id = @spot.id
      like.user_id = current_user.id
      if like.save
        flash[:success] = "You Liked This Spot!"
        redirect_to :back
      end
    else
      flash[:success] = "Spot Unliked!"
      redirect_to :back
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

  def search
    search = params[:search]
    @results = Spot.search(search)
    render :results
  end

  def delete_comment
    @spot = Spot.find(params[:spot_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to spot_path(@spot)
  end

  def lat_long
    @spot = Spot.find(params[:id])
    render json: {lat: @spot.latitude, long: @spot.longitude}
  end

  def add_image
    @spot = Spot.find(params[:id])
    @spot_picture = @spot.spot_pictures.new(picture_params)
    @spot_picture.user_id = current_user.id
    if @spot_picture.save
      flash[:notice] = "Image Saved!"
      redirect_to spot_path(@spot)
    else
      flash[:alert] = "Image Not Saved! " + @spot_picture.errors.full_messages.to_sentence
      redirect_to spot_path(@spot)
    end
  end

  private

  def spot_params
    params.require(:spot).permit(:name, :description, :category, :difficulty, :difficulty_description)
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def address_params
    params.require(:address).permit(:street, :city, :state, :zip)
  end

  def picture_params
    params.require(:spot_picture).permit(:picture)
  end
end
