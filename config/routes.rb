Auth::Application.routes.draw do

  resources :users  do
    get 'find', :on => :collection
  end
  
end
