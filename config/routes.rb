Doless::Application.routes.draw do
  
  get "profile/:id", :as=>'profile', :to=>'profile#show'

  resources :updates

  resources :tasks do
    member do
      get 'switch_completed'
      get 'switch_starred'
    end
    collection do
      get 'starred'
      get 'completed'
    end
  end

  scope ':project_id', :as=>'project' do
    resources :documents
    
    resources :tasks do
      member do
        get 'switch_completed'
      end
    end
    
    resources :tickets do
      resources :ticket_comments, :only=>[:index, :create, :destroy]
    end
    resources :topics do
      resources :posts, :only=>[:index, :create, :destroy]
    end
    resources :work_reports
    #root :to=>'projects#show'
  end
  resources :projects do
    collection do
      get 'all'
    end
  end
  
  resource :dashboard

  devise_for :users

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

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "dashboards#show"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
  match ':id' => "projects#show", :as=>:short_project
end
