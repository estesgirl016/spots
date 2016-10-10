class SpotsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show, :search ]
  def index
    @spots = Spot.page(params[:page]).per(3)
  end

  def show
    @spot = Spot.includes(:user).find(params[:id])
    @comments = @spot.comments.includes(:user).order(created_at: :desc)
    @comment = Comment.new
    @spot_picture = @spot.spot_pictures.new
    @spot_lats = Gmaps4rails.build_markers(@spots) do |spot, marker|
      marker.lat spot.latitude
      marker.lng spot.longitude
    end
  end

  def new
    @spot = Spot.new
    @address = Address.new
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.user_id = current_user.id
    @spot.address = Address.new(address_params)
    @address = @spot.address
    if @spot.save  && @address.save
      flash[:notice] = "Spot Saved Successfully!"
      redirect_to spot_path(@spot)
    else
      errors = ''
      if @spot.errors.any?
        errors += @spot.errors.full_messages.to_sentence
      end
      if @address.errors.any?
        errors += @address.errors.full_messages.to_sentence
      end
      flash[:alert] = "Spot Not Saved! " + errors

      redirect_to new_spot_path
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

  def search
    search = params[:search]
    @results = Spot.search(search).page(params[:page])
    render :results
  end

  def lat_long
    @spot = Spot.find(params[:id])
    render json: {lat: @spot.latitude, long: @spot.longitude}
  end

  def add_image
    @spot = Spot.find(params[:id])
    if params[:spot_picture] && params[:spot_picture][:picture]
      param = JSON.parse(params[:spot_picture][:picture]).first
      url = param['url']
      @spot_picture = @spot.spot_pictures.new(picture_params)
      @spot_picture.url = url
      @spot_picture.user_id = current_user.id
      if @spot_picture.save
        flash[:notice] = "Image Saved!"
        redirect_to spot_path(@spot)
      else
        flash[:alert] = "Image Not Saved! " + @spot_picture.errors.full_messages.to_sentence
        redirect_to spot_path(@spot)
      end
    else
      flash[:alert] = "Must select a picture"
      redirect_to spot_path(@spot)
    end
  end

  def delete_picture
    spot_picture = SpotPicture.find(params[:id])
    if spot_picture.destroy
      flash[:notice] = "Picture Deleted"
      redirect_to :back
    else
      flash[:alert] = "Picture Not Deleted"
      redirect_to :back
    end
  end

  private

  def spot_params
    params.require(:spot).permit(:name, :description, :category, :difficulty, :difficulty_description)
  end

  def address_params
    params.require(:address).permit(:street, :city, :state, :zip)
  end

  def picture_params
    params.require(:spot_picture).permit(:picture)
  end
end


