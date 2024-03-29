Rails.application.routes.draw do

  # You can have the root of your site routed with "root"
  root 'pages#main'

  # devise_for :users

  devise_for :users, controllers: { registrations: 'registrations' }
  # devise_scope :user do
  #   resource :registration,
  #     only: [:new, :create, :edit, :update],
  #     path: 'users',
  #     path_names: { new: 'sign_up' },
  #     controller: 'users/registrations',
  #     as: :user_registration do
  #       get :cancel
  #     end
  # end

  get 'pages/main'
  get 'pages/banking'
  post 'pages/transfer'
  get 'pages/transactions'
  post 'pages/deposit'

  resources :assets

  #this route is for file downloads 
  match "assets/get/:id" => "assets#get", :via => [:get]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  namespace :api, defaults: {format: 'json'} do
    post 'auth/login'
  end

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
