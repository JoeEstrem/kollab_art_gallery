class GalleriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = current_user.galleries.build(gallery_params)

    if @gallery.save
      redirect_to @gallery, notice: 'Gallery was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def create
  #   @gallery = Gallery.new(gallery_params)

  #   if @gallery.save
  #     redirect_to @gallery, notice: 'Gallery was successfully created.'
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  private

  def gallery_params
    params.require(:gallery).permit(:name, :address, :description, :price, :photo)
  end

end
