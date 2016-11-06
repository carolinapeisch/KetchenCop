Rails.application.routes.draw do
  root 'products#index'
  
  resources :contacts
  resources :regions
  resources :levels
  resources :images
  resources :users
  resources :purchases
  resources :products
  
  controller :images do
    post 'images/upload' => :upload
    get 'images/*path' => redirect('images')
  end
  
  controller :products do
    post 'products/upload' => :upload
    get 'products/*path' => redirect('products')
  end
  
  controller :regions do
    post 'regions/upload' => :upload
    get 'regions/*path' => redirect('regions')
  end
  
  controller :contacts do
    post 'contacts/upload' => :upload
    get 'contacts/*path' => redirect('contacts')
  end
  
  controller :levels do
    post 'levels/upload' => :upload
    get 'levels/*path' => redirect('levels')
  end
  
  controller :recalls do
      get 'recalls/search' => :search
      post 'recalls/upload' => :upload
  end
  resources :recalls do
    member do
      get 'recalls/*path' => redirect('recalls')
    end
  end

  
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
