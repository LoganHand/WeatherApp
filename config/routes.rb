Rails.application.routes.draw do
root "home#index"
get '/search', to: 'search#search', as: 'search'
#posts search _form to the search_controller search def from
post '/search', to: 'search#search', as: 'search_post'
get "up" => "rails/health#show", as: :rails_health_check

end
