class StatusesController < ApplicationController
  before_action :current_user_must_be_status_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_status_user
    status = Status.find(params[:id])

    unless current_user == status.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @statuses = Status.all
    @location_hash = Gmaps4rails.build_markers(@statuses.where.not(:location_latitude => nil)) do |status, marker|
      marker.lat status.location_latitude
      marker.lng status.location_longitude
      marker.infowindow "<h5><a href='/statuses/#{status.id}'>#{status.created_at}</a></h5><small>#{status.location_formatted_address}</small>"
    end
  end

  def show
    @status = Status.find(params[:id])
  end

  def new
    @status = Status.new
  end

  def create
    @status = Status.new
    @status.body = params[:body]
    @status.user_id = params[:user_id]
    @status.location = params[:location]

    if @status.save
      redirect_to "/statuses", :notice => "Status created successfully."
    else
      render 'new'
    end
  end

  def edit
    @status = Status.find(params[:id])
  end

  def update
    @status = Status.find(params[:id])

    @status.body = params[:body]
    @status.user_id = params[:user_id]
    @status.location = params[:location]

    if @status.save
      redirect_to "/statuses", :notice => "Status updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @status = Status.find(params[:id])

    @status.destroy

    redirect_to "/statuses", :notice => "Status deleted."
  end
end
