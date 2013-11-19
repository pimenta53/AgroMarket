Agrosocial::Application.routes.draw do
  get "/users/myads" => "users#myads"

  resources :ads do

    post "new_messages" => "messages#create"
  end
 

  
  devise_for :users, controllers: {registrations: 'registrations',sessions: 'sessions',passwords: 'passwords'}

  resources :users


  ### ADMIN ZONE ###
  namespace :admin do
    resources :price_types
    resources :types 
    resources :categories
    resources :cities
    resources :dashboard
    resources :ads
    resources :users
  end

  resources :ratings

  resources :messages
  post 'send_messages' => 'messages#create_mp'

  get 'done_message', to: 'ads#done_message', as: :done_message


  get "welcome/index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
