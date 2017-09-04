Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "videos#index"
  resources :videos
  post "videos/click_product" => "videos#click_product" 
  post '/track_scroll' => "videos#track_scroll" 
  post '/register_category_click' => "videos#register_category_click" 
  post '/track_toast_click' => "videos#track_toast_click"
  get 'videosm/:id' => "videos#show_manual", as: "show_manual"
  get '/analytics/:id' => "videos#analytics"
  post 'videos/dynamic_show' => 'videos#dynamic_show'
end
