Rails.application.routes.draw do
  post '/login' => 'users#login'
  post '/register', to: 'users#create'
  post '/recipes' => 'recipes#create'
  get  '/recipes/item' => 'recipes#index'
  get  '/recipes/:id' => 'recipes#show'
  get  '/title/:title' => 'recipes#title'
  get  '/cusine/:title' => 'recipes#title'
end
