class LinksController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @links = Link.where(user_id: current_user.id).search(params[:search]).order(sort_column + ' ' + sort_direction)
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
    if @link.read
      @link.update_attribute(:read, false)
    else
      @link.update_attribute(:read, true)
    end
    redirect_to user_links_path(current_user)
  end

  def live_search
    @links = Link.find_latest params[:s]
    render :layout => false
  end

  private

  def link_params
    params.require(:link).permit(:url,:title,:user_id)
  end

  def sort_column
    if params[:sort]
      Link.column_names.include?(params[:sort]) ? params[:sort] : "title"
    else
      Link.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
    end

  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
end
