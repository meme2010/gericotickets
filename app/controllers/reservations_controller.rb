class ReservationsController < ApplicationController

	def index
    @reservations = current_user.reservations
	end

	def show
		@reservation = current_user.reservations.find(params[:id])
	end

  def new
    @event = Event.find(params[:event_id])
    @reservation = @event.reservations.new
  end

  def create
    @event = Event.find(params[:event_id])
    @reservation = @event.reservations.new(params[:reservation])
    @reservation.user = current_user

    if @reservation.save
      redirect_to event_reservation_path(@event, @reservation)
    else
      render :new
    end
  end

end
