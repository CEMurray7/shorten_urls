Rails.application.routes.draw do
  resources :long_urls
    root 'long_urls#index'
    # get '/longlinks'=>'longlinks#index'
    get "/:id" => 'long_url#show'
end
