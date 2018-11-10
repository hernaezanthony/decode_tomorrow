class Api::HouseController < ApplicationController

	skip_before_action :verify_authenticity_token

	respond_to :json

	def intialize
  	    @http_status = 200
   		@http_response = {}
  	end

	def index 
		houses = House.all
		@http_response = houses
     	@http_status = 200
      	render :json => @http_response, :status => @http_status
    end

    def show
		houses = House.all
		@http_response = houses
     	@http_status = 200
      	render :json => @http_response, :status => @http_status
    end

    def createInquiry
    	inquiry = Inquiry.new(inquiry_params)
    	if inquiry.save
            @http_response = inquiry
            @http_status = 200
            status = true
      	else
        		@http_response = {
                      :result => "failed",
                      :message => "Error!"
                      }.to_json
        		@http_status = 400
            	status = false
        end
          render :json => @http_response, :status => @http_status  
    end

    def inquiryShow
      inquiries = Inquiry.where(userID: params[:userID]);
      @http_response = inquiries
      @http_status = 200
      render :json => @http_response, :status => @http_status
    end


    def setTripSchedule

      trip = Trip.new(trip_params)
      if trip.save
            @http_response = trip
            @http_status = 200
            status = true
        else
            @http_response = {
                      :result => "failed",
                      :message => "Error!"
                      }.to_json
            @http_status = 400
              status = false
        end
          render :json => @http_response, :status => @http_status 

      
    end

    def createDecision

      decision = Decision.new(decision_params)
      if decision.save
            @http_response = decision
            @http_status = 200
            status = true
        else
            @http_response = {
                      :result => "failed",
                      :message => "Error!"
                      }.to_json
            @http_status = 400
              status = false
        end
          render :json => @http_response, :status => @http_status 
    end

    def paymentShow
      payments = Payment.where(userID: params[:userID]);
      @http_response = payments
      @http_status = 200
      render :json => @http_response, :status => @http_status
    end

    def getConstructionUpdate
      construction = Construction.find_by(userID: params[:userID]);
      @http_response = construction
      @http_status = 200
      render :json => @http_response, :status => @http_status
    end


    def createFeedbacks

      feedback = Feedback.new(feedback_params)
      if feedback.save
            @http_response = feedback
            @http_status = 200
            status = true
        else
            @http_response = {
                      :result => "failed",
                      :message => "Error!"
                      }.to_json
            @http_status = 400
              status = false
        end
          render :json => @http_response, :status => @http_status 

    end

private

  def inquiry_params
     params.permit(:name, :bedroomCount, :floorArea, :lotArea, :status, :userID)
  end

  def trip_params
     params.permit(:date, :time, :inquiryID, :userID)
  end

  def decision_params
     params.permit(:status, :message, :userID)
  end

  def feedback_params
     params.permit(:feedbackType, :message, :userID)
  end
end
