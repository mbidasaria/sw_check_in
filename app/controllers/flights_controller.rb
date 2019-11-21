class FlightsController < ApplicationController
  def index
    @flights = Flight.all

    render("flight_templates/index.html.erb")
  end

  def show
    @flight = Flight.find(params.fetch("id_to_display"))

    render("flight_templates/show.html.erb")
  end

  def new_form
    @flight = Flight.new

    render("flight_templates/new_form.html.erb")
  end

  def create_row
    @flight = Flight.new

    @flight.description = params.fetch("description")
    @flight.departs_at = params.fetch("departs_at")
    @flight.user_id = params.fetch("user_id")
    @flight.ten_minute_message_sent = params.fetch("ten_minute_message_sent")
    @flight.five_minute_message_sent = params.fetch("five_minute_message_sent")
    @flight.one_minute_message_sent = params.fetch("one_minute_message_sent")

    if @flight.valid?
      @flight.save

      redirect_back(:fallback_location => "/flights", :notice => "Flight created successfully.")
    else
      render("flight_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @flight = Flight.find(params.fetch("prefill_with_id"))

    render("flight_templates/edit_form.html.erb")
  end

  def update_row
    @flight = Flight.find(params.fetch("id_to_modify"))

    @flight.description = params.fetch("description")
    @flight.departs_at = params.fetch("departs_at")
    @flight.user_id = params.fetch("user_id")
    @flight.ten_minute_message_sent = params.fetch("ten_minute_message_sent")
    @flight.five_minute_message_sent = params.fetch("five_minute_message_sent")
    @flight.one_minute_message_sent = params.fetch("one_minute_message_sent")

    if @flight.valid?
      @flight.save

      redirect_to("/flights/#{@flight.id}", :notice => "Flight updated successfully.")
    else
      render("flight_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @flight = Flight.find(params.fetch("id_to_remove"))

    @flight.destroy

    redirect_to("/users/#{@flight.user_id}", notice: "Flight deleted successfully.")
  end

  def destroy_row
    @flight = Flight.find(params.fetch("id_to_remove"))

    @flight.destroy

    redirect_to("/flights", :notice => "Flight deleted successfully.")
  end
end
