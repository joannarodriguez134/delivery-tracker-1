class TrackersController < ApplicationController
  def index
    matching_trackers = Tracker.all

    @list_of_trackers = matching_trackers.order({ :created_at => :desc })

    render({ :template => "trackers/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_trackers = Tracker.where({ :id => the_id })

    @the_tracker = matching_trackers.at(0)

    render({ :template => "trackers/show" })
  end

  def create
    the_tracker = Tracker.new
    the_tracker.user_id = params.fetch("query_user_id")
    the_tracker.delivery_status = params.fetch("query_delivery_status", false)
    the_tracker.description = params.fetch("query_description")
    the_tracker.supposed_to_arrive_on = params.fetch("query_supposed_to_arrive_on")
    the_tracker.details = params.fetch("query_details")

    if the_tracker.valid?
      the_tracker.save
      redirect_to("/trackers", { :notice => "Tracker created successfully." })
    else
      redirect_to("/trackers", { :alert => the_tracker.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_tracker = Tracker.where({ :id => the_id }).at(0)

    the_tracker.user_id = params.fetch("query_user_id")
    the_tracker.delivery_status = params.fetch("query_delivery_status", false)
    the_tracker.description = params.fetch("query_description")
    the_tracker.supposed_to_arrive_on = params.fetch("query_supposed_to_arrive_on")
    the_tracker.details = params.fetch("query_details")

    if the_tracker.valid?
      the_tracker.save
      redirect_to("/trackers/#{the_tracker.id}", { :notice => "Tracker updated successfully."} )
    else
      redirect_to("/trackers/#{the_tracker.id}", { :alert => the_tracker.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_tracker = Tracker.where({ :id => the_id }).at(0)

    the_tracker.destroy

    redirect_to("/trackers", { :notice => "Tracker deleted successfully."} )
  end
end
