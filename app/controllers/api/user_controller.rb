class Api::UserController < ApplicationController

	# before_action :cors_set_access_control_headers
	skip_before_action :verify_authenticity_token

	respond_to :json

	# def cors_set_access_control_headers
 #    	response.headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, PATCH, DELETE, OPTIONS'
 #    	response.headers['Access-Control-Allow-Origin'] = '*'
 #    	# response.headers['Origin'] = '*'
 #    	response.headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token, Auth-Token, Email'
 #    	response.headers['Access-Control-Max-Age'] = "1728000"
 #    	response.headers['X-XSS-Protection'] = "0"
 #  	end


    def intialize
  	    @http_status = 200
   		@http_response = {}
  	end

	def index 
		user = User.all
		@http_response = user
     	@http_status = 200
      	render :json => @http_response, :status => @http_status
    end
    
    def show
      user = User.all
      @http_response = user
      @http_status = 200
      render :json => @http_response, :status => @http_status
    end	

   	def register
      	user = User.new(user_params)
      	if user.save
            @http_response = user
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


    def login
       user = User.find_for_database_authentication(:email => params[:email])
          if user
              if user.valid_password?(params[:password])
                  @status = true 
                  #access_token(user) 
                  @http_response = {
                    :result => "success",
                    :message => "Welcome!",
                    :user_id => user.id
                    }.to_json
                  @http_status = 200  
              else
                  @http_response = {
                    :result => "failed",
                    :message => "Incorrect Password!"
                    }.to_json
                  @status = false
              end
          else
            @http_response = {
              :result => "failed",
              :message => " Invalid Email!"
              }.to_json
          end
        render :json => @http_response, :status => @http_status
    end

    
    def logout
          user = User.find_by(token: params[:token])
          if temp = user.token
            user.update_attribute(:token, nil) #clear token
              @http_response = {
              :result => "success",
              :message => "Logged-out! !"
              }.to_json
          else
            @http_response = {
              :result => "failed",
              :message => "Try Again!"
              }.to_json
          end   
            render :json => @http_response
    end

    def access_token(user)
        token = SecureRandom.hex(8)
        user.update_attribute(:token, token)
    end
 

private

  def user_params
     params.permit(:email,:first_name,:last_name, :password, :password_confirmation,:mobile_number,:landline_number,:address)
  end



end
