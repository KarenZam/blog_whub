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
    resources :articles, defaults: { format: :json }, except: [:new, :edit] do
      resources :comments, defaults: { format: :json }, except: [:new, :edit]
    end
  end

  resources :users, except: [ :new, :edit ], default: { format: :json }

  # Password reset (coded links)
  get   'reset/:code' => 'password#edit',  as: :reset          # Password reset form
  put   'reset/:code' => 'password#update'
  patch 'reset/:code' => 'password#update'                     # Reset users password

  root 'site#index'

end
