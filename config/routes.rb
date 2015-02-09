Rails.application.routes.draw do

  %w( 404 422 500 ).each do |code|
    get code, :to => "errors#error", :code => code
  end

  get 'admin' => 'admin#root', as: :admin_login
  post 'admin' => 'admin#login'
  get 'admin/hackers' => 'admin#hackers', as: :admin_hackers
  get 'admin/mentors' => 'admin#mentors', as: :admin_mentors
  get 'admin/view/:id' => 'admin#view', as: :admin_view_user
  get 'admin/have_forms/:id' => 'admin#have_forms', as: :admin_have_forms
  get 'admin/emails.txt' => 'admin#all_emails'
  get 'admin/hacker_emails.txt' => 'admin#hacker_emails'
  get 'admin/mentor_emails.txt' => 'admin#mentor_emails'
  delete 'admin/sign_out' => 'admin#logout', as: :admin_logout

  devise_for :hackers, :skip => [:registrations, :sessions]
  devise_scope :hacker do
    post "sign_in" => "session#create", as: :hacker_session
    delete "sign_out" => "session#destroy", as: :destroy_hacker_session
    get "reset" => "reset#new", as: :start_password_reset
    post "reset" => "reset#create", as: :password_reset_lookup
    get "recover" => "reset#edit", as: :change_hacker_password
    post "recover" => "reset#update", as: :update_hacker_password
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root "registration#home", as: :root
  get "/" => "registration#home", as: :new_hacker_session
  get "hacker/sign_up" => "registration#hacker_sign_up", as: :hacker_sign_up
  get "mentor/sign_up" => "registration#mentor_sign_up", as: :mentor_sign_up
  get "info" => "registration#info"
  post "info" => "registration#update_info"
  get "status" => "registration#status"
  get "team" => "registration#team_view", as: :team



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
