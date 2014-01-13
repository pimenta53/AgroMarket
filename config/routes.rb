Agrosocial::Application.routes.draw do

  root 'welcome#index'

  #get "/plans", :to => "plans#index"
  resources :plans



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
  get "highlight_ad/:id" => "ads#highlight" , as: "highlight_ad"

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
    resources :plans
    resources :publicities

    namespace :academy do
      resources :tutorials
      resources :questions
    end

    namespace :event do
      resources :events
    end


    get 'cancel_message',  to: 'ads#cancel_message',              as: :cancel_message
    #get 'done_message',    to: 'ads#done_message',                as: :done_message
    get 'aprove_tutorial', to: 'academy/tutorials#aprove_tutorial', as: :aprove_tutorial

    get 'aprove_event', to: 'event/events#aprove_event', as: :aprove_event
    get 'unaprove_event', to: 'event/events#unaprove_event', as: :unaprove_event

  end

  resources :ratings

  resources :messages
  post 'send_messages' => 'messages#create_mp'

  get 'done_message', to: 'ads#done_message', as: :done_message

  get 'cancel_message', to: 'ads#cancel_message', as: :cancel_message

  get "refresh_header" => "application#refresh_header"

  get "welcome/index"

end
