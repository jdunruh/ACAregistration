ACAregistration::Application.routes.draw do

  resources :aca_data

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users
  match "/race_events/select" => "race_events#select"
  match "/race_events/selection" => "race_events#selection"
  match "/rider_registrations/new_rider" => "rider_registrations#new_rider" , :as => :register_rider
  match "/rider_registrations/new_rider_by_name" => "rider_registrations#new_rider_by_name"
  match "/riders/find" => "rider_registrations#find", :as => :find_riders
  match "/riders/upload_file" => "riders#upload_file"
  match "/riders/upload" => "riders#upload"
  match "riders/new_one_day" => "riders#new_one_day", :as => :new_one_day_rider

  resources :race_events
  resources :riders
  resources :rider_registrations
  resources :entries


  resources :race_types

  resources :old_riders

  resources :categories

  resources :races

  root :to => "race_events#select"


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with root
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
