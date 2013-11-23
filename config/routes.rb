BlogWhub::Application.routes.draw do

# User registration (coded links)
  get  'register/:code' => 'users#new',   as: :register        # Registration form
  post 'register/:code' => 'users#create'                      # Create new user/destroy registrant
  
  get    'login'  => 'session#new',     as: :login             # Login form
  post   'login'  => 'session#create'                          # Log user in (start session)
  delete 'logout' => 'session#destroy', as: :logout            # Log user out (end session)

  #just testing from browser
  get 'logout' => 'session#destroy'                 # delete for production just testing

  scope :api do
    resources :articles, except: [:new, :edit, :show], defaults: { format: :json } do
      get ':id' => 'articles#index', on: :collection
      resources :comments, except: [:new, :edit, :show], 
        defaults: { format: :json } do
          get ':id' => 'comments#index', on: :collection
        end
      resources :tags, only: [ :index ], defaults: { format: :json }
    end
    resources :tags, except: [ :new, :edit, :show], 
      defaults: { format: :json} do
      get ':id' => 'tags#index', on: :collection
    end
    resources :users, except: [:show, :new, :edit], 
      defaults: { format: :json } do
        get ':id' => 'users#index', on: :collection
        resources :articles, only: [ :index ]
     end
  end

  resources :users, except: [ :new, :edit ], defaults: { format: :json }

  

  # Password reset (coded links)
  get   'reset/:code' => 'password#edit',  as: :reset          # Password reset form
  put   'reset/:code' => 'password#update'
  patch 'reset/:code' => 'password#update'                     # Reset users password

  root 'site#index'

end
