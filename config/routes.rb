Rails.application.routes.draw do
  resources :products, only: [:show] do
    member do
      get :exact_match
      post :toggle_product
    end
  end
  resources :exact_requests, only: [:show, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "videos#index"
  resources :videos
  post "/click_product" => "videos#click_product"

  post '/track_scroll' => "videos#track_scroll"
  post '/register_category_click' => "videos#register_category_click"
  post '/record_session_duration' => "videos#record_session_duration"
  post '/update_session_time' => "videos#update_session_time"
  post '/track_toast_click' => "videos#track_toast_click"
  post '/active_media_duration' => "videos#active_media_duration"
  get 'videosm/:id' => "videos#show_manual", as: "show_manual"
  get 'videos/woc/:id' => "videos#woc", as: "woc"
  get '/analytics/:id' => "videos#analytics"
  post 'videos/dynamic_show' => 'videos#dynamic_show'
  get 'videos/rv/:id' => "videos#rv", as: "rv"

  # FOR LINEAR LANDING
  resources :scenes
  get '/t&c' => "scenes#t_and_c", as: "t_and_c"
end
