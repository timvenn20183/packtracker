Scouts::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
    root 'main#index'

    get 'sign_in' => 'main#sign_in'
    post 'process_sign_in' => 'main#process_sign_in'
    get 'sign_out' => 'main#sign_out'

    get 'daytoday' => 'daytoday#index'

    get 'attendance' => 'attendance#index'
    post 'attendance/create' => 'attendance#create'
    get 'attendance/update_create_list' => 'attendance#update_create_list'
    get 'attendance/update_recruits_event_status' => 'attendance#update_recruits_event_status'

    get 'parents/edit/:id' => 'parents#edit'
    post 'parents/update/:id' => 'parents#update'
    post 'parents/create' => 'parents#create'
    get 'parents/enrole' => 'parents#enrole'

    get 'recruits/edit/:id' => 'recruits#edit'
    post 'recruits/update/:id' => 'recruits#update'
    get 'recruits/enroll' => 'recruits#enroll'
    post 'recruits/create' => 'recruits#create'

    get 'family' => 'family#index'
    get 'family/my_family' => 'family#my_family'
    get 'family/family_management' => 'family#family_management'
    post 'family/search' => 'family#search'
    get 'family/enrole' => 'family#enrole'

    get 'adultroles/token_search' => 'adultroles#token_search'

    get 'committees/token_search' => 'committees#token_search'

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
