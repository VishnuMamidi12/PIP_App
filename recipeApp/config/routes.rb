Rails.application.routes.draw do
  post '/login' => 'users#login'
  post '/register', to: 'users#create'
  post '/recipes' => 'recipes#create'
  get  '/recipes/item' => 'recipes#index'
  get  '/recipes/:id' => 'recipes#show'
  get  '/title/:id' => 'recipes#title'
  get  '/cusine/:title' => 'recipes#title'
  delete 'recipes/delete/:id' => 'recipes#destroy'
end
