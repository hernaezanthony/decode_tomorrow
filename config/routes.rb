Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  namespace :api, :defaults => { :format => :json } do

  	resources :user

  	post '/user/register' => 'user#register', :as => 'register'
    post '/user/login' => 'user#login', :as => 'login'
    post '/user/logout' => 'user#logout', :as => 'logout'
    get  '/user/show' => 'user#show', :as => 'show_all_user'

	
	resources :house

	get  '/house/show' => 'house#show', :as => 'show_all_houses'	
  post  '/house/createInquiry' => 'house#createInquiry', :as => 'createInquiry'
  get  '/house/inquiryShow/:userID' => 'house#inquiryShow', :as => 'show_all_inquiries'  
  post '/house/setTripSchedule' => 'house#setTripSchedule', :as => 'setTripSchedule'
  post '/house/createDecision' => 'house#createDecision', :as => 'createDecision'
  get '/house/paymentShow/:userID' => 'house#paymentShow', :as => 'paymentShow'
  get '/house/getConstructionUpdate/:userID' => 'house#getConstructionUpdate', :as => 'getConstructionUpdate'
  post '/house/createFeedbacks' => 'house#createFeedbacks', :as => 'createFeedbacks'
  

	end
end
