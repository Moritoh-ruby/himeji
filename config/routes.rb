Rails.application.routes.draw do

get '/setting'  => 'setting#rgtr_goal'
post '/rgtr-goal-money'  => 'setting#rgtr_goal_money'
post '/endurance' => 'setting#create_endurance'
get  '/create_excuse' => 'excuse#create_excuse'
post '/create_excuse' => 'excuse#create_excuse' 

get 'show' => 'excuse#show'

get '/edit' => 'update#edit'

patch '/update' => 'update#update'
put '/update' => 'update#update'
post '/update' => 'update#update'

devise_for :users, :controllers => {
  :sessions      => "users/sessions",
  :registrations => "users/registrations",
  :passwords     => "users/passwords",
  :omniauth_callbacks => "users/omniauth_callbacks" 
}

get '/'  => 'top#index'
post '/result'  => 'top#result'
get '/result' => 'top#result'

# The priority is based upon order of creation: first created -> highest priority.
#index'
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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

