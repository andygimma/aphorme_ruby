#
# Developer : Andy Gimma (andy.n.gimma@gmail.com)
# Date : 08/14/13
# All code (c)2013 Andy Gimma all rights reserved
#

Aphorme1::Application.routes.draw do
  match '/', to: 'static_pages#home'
  match '/about', to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'
  match '/guide', to: 'static_pages#guide'
  match '/signup', to: 'static_pages#signup'
  
  
  match '/auth/:provider/callback' => 'sessions#create'
  match '/auth/failure', to: 'sessions#failure'
  match '/session/destroy/:id', to: 'sessions#destroy'
  match '/signin', to: 'sessions#new'
  match '/user/create', to: 'sessions#create_without_omniauth'
  match '/user/signin', to: 'sessions#signin'

  match '/forgot_password', to: 'sessions#forgot_password'
  match '/logout', to: 'sessions#logout'
  
  match '/terms/new', to: 'terms#new'
  match '/terms/create', to: 'terms#create'
  match '/terms/index', to: 'terms#index'
  match '/terms/search', to: 'terms#search_ui'
  match '/terms/:term_id', to: 'terms#read'
  match '/edit_term/:term_id', to: 'terms#new_version_form'
  match '/update_term', to: 'terms#new_version'
  match '/search_terms/:search_term', to: 'terms#search'
  match '/search_term', to: 'terms#search_term'
  match '/save_search_info/:term_id', to: 'terms#save_search_info'
  
  match '/term_map', to: 'terms#term_map'
  match '/term_map_api', to: 'terms#term_map_api'

  match '/search_map', to: 'terms#search_map'
  match '/search_map_api', to: 'terms#search_map_api'
  
  match '/term_autocomplete_api', to: 'terms#term_autocomplete_api'
  
  match '/versions/:term_id', to: 'terms#versions'



  resource :session
  


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

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
