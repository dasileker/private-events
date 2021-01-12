class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
    @event = current_user.organized_events.build(event_params)
    if @event.save
      flash[:success] = "Event created."
      redirect_to current_user
    else
      render 'new'
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
    @attendees = @event.attendees
    redirect_to root_url and return unless logged_in?
  end

  def index
    @events = Event.all
    redirect_to root_url and return unless logged_in?
  end

  private
    def event_params
      params.require(:event).permit(:title, :location, :date, :start_time)
    end

end
