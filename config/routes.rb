Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "videos#index"
  resources :videos
  post "videos/click_product" => "videos#click_product" 
  post '/track_scroll' => "videos#track_scroll" 
end
