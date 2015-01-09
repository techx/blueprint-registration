Rails.application.routes.draw do

  devise_for :hackers, :skip => [:registrations, :sessions]
  devise_scope :hacker do
    post "sign_in" => "devise/sessions#create", as: :hacker_session
    delete "sign_out" => "devise/sessions#destroy", as: :destroy_hacker_session
    post "sign_up" => "sanitizer#create", as: :hacker_registration
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root "registration#home", as: :new_hacker_session_path
  get "hacker/sign_up" => "registration#hacker_sign_up", as: :hacker_sign_up
  get "mentor/sign_up" => "registration#mentor_sign_up", as: :mentor_sign_up
  get "apply" => "registration#apply"
  post "apply" => "registration#update"
  get "status" => "registration#status"
  get "team" => "registrations#team_view"
  post "team/join" => "registrations#team_join"
  delete "team/leave" => "registrations#team_leave"



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
