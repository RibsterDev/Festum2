class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :categories, :show]
  before_action :find_event, only: [:show, :edit, :update, :destroy]

  IMAGE_URL = {
    'Concert' => 'https://images.unsplash.com/photo-1464375117522-1311d6a5b81f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80',
    'Festival' => 'https://images.unsplash.com/photo-1514525253161-7a46d19cd819?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80',
    'Musique' => 'https://images.unsplash.com/photo-1556379118-7034d926d258?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1576&q=80',
    'Exposition' => 'https://images.unsplash.com/photo-1531243269054-5ebf6f34081e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80',
    'Danse' => 'https://images.unsplash.com/photo-1508700929628-666bc8bd84ea?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80',
    'Spectacle' => 'https://images.unsplash.com/photo-1469510360132-9fa6abcd9df0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80',
    'Théâtre' => 'https://images.unsplash.com/photo-1507924538820-ede94a04019d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80'
  }

  def index
    cookies[:category] = params[:category]
    @events = EventHome.new(cookies).result
  end

  def show
    # creation d'une instance @is_creator ou on assigne current_user, ce dernier correspond à @event.creator
    # dans la vue show on affiche le lien delete pour la personne qui a crée l'event

    cookies[:id] = params[:id]
    cookies[:name] = params[:name]

    cookies[:event_id] = params[:id]
    # if user_signed_in?
    #   @is_creator = current_user == @event.creator
    # else
    #   @is_creator = false
    # end
  end


  def categories
    @img_url = IMAGE_URL
    cookies[:date_start] = params[:date_start]
    cookies[:address] = params[:address].capitalize if params.key? :address
    # cookies[:address] = Event.near(params[:address], 50)
    @events = EventHome.new(cookies).home
    true == false
    # @events = @events.geocoded #returns events with coordinates

    @markers = @events.map do |event|
      {
        lat: event.lat,
        lng: event.long,
        infoWindow: render_to_string(partial: "map_info_window", locals: { event: event }),
        image_url: helpers.asset_url(event.photo_url)
      }
    end
  end


  def home
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :date_start, :date_end, :address, :category, :photo_url)
  end
end
