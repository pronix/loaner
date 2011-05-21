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
      get 'repayments'
      get 'disbursements'
      get 'book_transfers'
      get 'account_transfers'
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
    collection do
      get "calculate_payment_schedule"
    end
    resources :transactions
  end

  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout

  namespace :settings do
    resources :user_rights
    root :to => "home#index"
  end

  namespace :reports do
    resources :payment_schedules
    resources :borrowers_lists, :only => [:index] do
      collection do
        get 'blacklisted'
        get 'alphabet'
      end
    end
    namespace :borrowers do
      resource :borrower_statements, :only => [:create,:show]
      resource :borrower_history, :controller => :borrower_history, :only => [:create,:show]
      root :to => "home#index"
    end
    namespace :for_submission do
      resource :monthly, :controller => :monthly, :only => [:show] do
        member do
          get 'main'
        end
      end
      namespace :quarterly do
        resource :loan_position, :controller => :loan_position, :only => :show
        resource :cash_position, :controller => :cash_position, :only => :show
        resource :receipts_and_payments, :only => :show
        root :to => "home#index"
      end
      root :to => "home#index"
    end
    namespace :for_records do
      resource :cash_account_books, :only => [:create,:show]
      resource :loan_account_books, :only => [:create,:show]
      root :to => "home#index"
    end
    namespace :for_governments do
      resource :statements, :only => [:create,:show]
      root :to => "home#index"
    end
    namespace :payment_due do
      resource :daily, :controller => :daily, :only => [:create,:show]
      resource :calendar_view, :controller => :calendar_view, :only => [:show]
      resource :aging, :controller => :aging, :only => [:show]
      root :to => "home#index"
    end

    namespace :book_statements do
      root :to => "home#index"
    end

    namespace :loan do
      resource :status, :controller => :status, :only => [:show] do
        member do
          get 'active'
          get 'closed'
        end
      end
    end
    root :to => "home#index"
  end

  namespace :admin do
    resources :company_profiles
    resources :users
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
