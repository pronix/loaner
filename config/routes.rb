Loaner::Application.routes.draw do
  resources :people
  resources :books
  resources :lenders

  resource  :calculators do
    member do
      put 'calculate'
    end
  end
  resources :users
  resources :user_sessions
  resources :company_transactions do
    collection do
      get 'receipts'
      get 'payments'
    end
  end
  resources :backups do
    collection do
      get 'backup'
      post 'restore'
    end
  end

  resources :company_configurations
  resources :company_profiles

  resources :transactions
  resources :loans do
    resources :transactions
  end

  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
  namespace :settings do
    resources :user_rights
    root :to => "home#index"
  end

  namespace :reports do
    resources :payment_schedules
    resources :borrowers_lists, :only => [:index]
    namespace :borrowers do
      resource :borrower_statements, :only => [:create,:show]
      resource :borrower_history, :controller => :borrower_history, :only => [:create,:show]
      root :to => "home#index"
    end
    namespace :for_submission do
      root :to => "home#index"
    end
    namespace :for_records do
      resource :cash_account_books, :only => [:create,:show]
      resource :loan_account_books, :only => [:create,:show]
      root :to => "home#index"
    end
    namespace :payment_due do
      resource :daily, :controller => :daily, :only => [:create,:show]
      root :to => "home#index"
    end
    root :to => "home#index"
  end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "home#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
