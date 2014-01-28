LuluRpg::Application.routes.draw do

  get 'casadabaro' => 'admin#index', :as => 'key_list'
  get 'casadabaro/criar-chave' => 'admin#new', :as => 'new_key'
  post 'casadabaro/salvar-chave' => 'admin#create', :as => 'save_key'
  get 'casadabaro/usuarios-da-chave/:key' => 'admin#key_users', :as => 'key_users'

  root 'home#index'
  get '/c/:key' => 'home#register', :as => 'register'
  post '/c/:key' => 'home#register', :as => 'register_save'  
  
  get '/chave-invalida' => 'home#invalid_key', :as => 'invalid_key'
  get '/recalque' => 'home#no_slots', :as => 'no_slots'
  get '/em-breve' => 'home#wait_soon', :as => 'wait_soon'

	get '/grid-de-avaliacoes' => 'home#review_grid', :as => 'review_grid'
  # The priority is based upon order of creation: first created -> highest priority.
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
