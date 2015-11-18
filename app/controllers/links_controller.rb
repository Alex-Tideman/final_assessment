class LinksController < ApplicationController
  def index
    @links = Link.where(user_id: current_user.id)
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id if current_user
    if @link.save
      flash[:notice] = "Link added"
      redirect_to user_links_path(current_user)
    else
      flash[:error] = "Invalid URL"
      redirect_to user_links_path(current_user)
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(link_params)
      flash[:notice] = "Link Updated"
      redirect_to user_links_path(current_user)
    else
      flash[:error] = "Invalid URL"
      redirect_to user_links_path(current_user)
    end
  end

  def update_read
    @link = Link.find(params[:id])
    if @link.read == false
      @link.update_attribute(:read, true)
    else
      @link.update_attribute(:read, false)
    end
    redirect_to user_links_path(current_user)
  end

  private

  def link_params
    params.require(:link).permit(:url,:title,:user_id)
  end
end
