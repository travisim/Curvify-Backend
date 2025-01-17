Rails.application.routes.draw do

  # root 'sessions#home'
  resources :users, only: [:index,:create, :create, :show, :destroy, :update]
  namespace :api do
    namespace :v1 do
      get 'users/index'
      post 'users/create'
      get 'users/show/:id', to: 'users#show'
      delete 'users/destroy/:id', to: 'users#destroy'
      put 'users/update/:id', to: 'users#update'
      post 'users/logout', to: 'users#logout'
      get 'users/me', to: 'users#me'
      
      post 'auth/login', to: 'auth#login'

      get 'forum_thread/index'
      post 'forum_thread/create'
      get 'forum_thread/show/:id', to: 'forum_thread#show'
      delete 'forum_thread/destroy/:id', to: 'forum_thread#destroy'
      get 'forum_thread/showForumThreadsByCategory/:category', to: 'forum_thread#showForumThreadsByCategory'
      put 'forum_thread/update/:id', to: 'forum_thread#update'


      get 'forum_thread_comments/index'
      post 'forum_thread_comments/create'
      get 'forum_thread_comments/showCommentsForThread/:forum_thread_id', to: 'forum_thread_comments#showCommentsForThread'
      
      put 'forum_thread_comments/update/:id', to: 'forum_thread_comments#update'

      get 'forum_thread_comments/show/:id', to: 'forum_thread_comments#show'
      delete 'forum_thread_comments/destroy/:id', to: 'forum_thread_comments#destroy'
    end
  end 
 
  root 'homepage#index'
  get '/*path' => 'homepage#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
