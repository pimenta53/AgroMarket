Agrosocial::Application.routes.draw do
  resources :plans

  resources :cities

  namespace :admin do
    resources :publicities
  end

  namespace :admin do
    namespace :event do
      resources :events
    end
  end

  namespace :event do
    resources :events
  end

  get "/44", :to => "errors#not_found"

  get "/404", :to => "errors#not_found"

  get "/422", :to => "errors#unacceptable"

  get "/500", :to => "errors#internal_error"

  #facebook callback
  match '/auth/failure' => 'authentications#failure', via: :all
  match '/auth/:provider/callback' => 'authentications#create', via: :all
  get '/redirect', :to => redirect('/redirect.html')
  post '/redirect', :to => redirect('/redirect.html')
  get '/refresh', :to => redirect('/refresh.html')
  post '/refresh', :to => redirect('/refresh.html')

  get "academy" => "academy#index"
  ### ACADEMY ZONE ###
  namespace :academy do
    resources :questions
    resources :votes
    resources :answers

    post "answers/new" => "answers#create"

    resources :workshops
    resources :workshop_registrations
    resources :tutorials
    resources :tutorial_images

    get 'up_vote', to: 'votes#up_vote', as: :up_vote
    get 'down_vote', to: 'votes#down_vote', as: :down_vote
  end

  #pagina myads do utilizador
  get "/users/:id/myads" => "users#myads", as: "myads_user"

  get "/users/:id/myevents" => "users#myevents", as: "myevents"

  #accao follow do utilizador
  post '/users/:id/follow' => 'users#follow'

  resources :ads do
    post "new_messages" => "messages#create"
  end

  devise_for :users, controllers: {registrations: 'registrations',sessions: 'sessions',passwords: 'passwords'}


  resources :users, :login, :authentications

  #SEARCH
  get '/search' => 'search#search_for_all'

  get '/search_tutorials' => 'search#search_tutorials'




  ### ADMIN ZONE ###
  namespace :admin do
    resources :price_types
    resources :types
    resources :categories
    resources :cities
    resources :dashboard
    resources :ads
    resources :users

    namespace :academy do
      resources :tutorials
      resources :questions
    end


    get 'cancel_message',  to: 'ads#cancel_message',              as: :cancel_message
    #get 'done_message',    to: 'ads#done_message',                as: :done_message
    get 'aprove_tutorial', to: 'academy/tutorials#aprove_tutorial', as: :aprove_tutorial

    get 'aprove_event', to: 'event/events#aprove_event', as: :aprove_event
  end

  resources :ratings

  resources :messages
  post 'send_messages' => 'messages#create_mp'

  get 'done_message', to: 'ads#done_message', as: :done_message

  get 'cancel_message', to: 'ads#cancel_message', as: :cancel_message

  get "refresh_header" => "application#refresh_header"

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
