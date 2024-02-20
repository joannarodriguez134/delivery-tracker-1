class DeliveriesController < ApplicationController
  def index
    matching_deliveries = Delivery.all

    @list_of_deliveries = matching_deliveries.order({ :created_at => :desc })

    @waiting_on_deliveries = @list_of_deliveries.where(arrived: false)
    @delivered = @list_of_deliveries.where(arrived: true)

    render({ :template => "deliveries/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_deliveries = Delivery.where({ :id => the_id })

    @the_delivery = matching_deliveries.at(0)

    render({ :template => "deliveries/show" })
  end

  def create
    @the_delivery = Delivery.new
    @the_delivery.description = params.fetch("query_description")
    @the_delivery.supposed_to_arrive_on = params.fetch("query_supposed_to_arrive_on")
    @the_delivery.details = params.fetch("query_details")
    @the_delivery.arrived = false

    if @the_delivery.valid?
      @the_delivery.save
      redirect_to("/deliveries", { :notice => "Delivery created successfully." })
    else
      redirect_to("/deliveries", { :alert => @the_delivery.errors.full_messages.to_sentence })
    end
  end

  def update
    # retrieve delivery id
    the_delivery = params.fetch("path_id")

    # look at the collection and find the specific deliviery

    @delivery = Delivery.where(id: the_delivery)

    # update the arrive the method
    @delivery.arrived = true


    # add redirect to delivery index
    if @delivery.valid?
        @delivery.save
        redirect_to("/deliveries", { :notice => "Marked as received."} )
      else
        redirect_to("/deliveries", { :alert => @delivery.errors.full_messages.to_sentence })

      end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_delivery = Delivery.where({ :id => the_id }).at(0)

    the_delivery.destroy

    redirect_to("/deliveries", { :notice => "Delivery deleted successfully."} )
  end
end
