Rails.application.routes.draw do

  get 'employees/:employee_id/project_requests' => 'project_requests#index', as: :my_project_requests
  
  get 'employees/:employee_id/project_requests/:project_request_id/assignments/new' => 'assignments#new', as: :new_assignment
  post 'employees/:employee_id/project_requests/:project_request_id/assignments/new' => 'assignments#create', as: :create_assignment
  get 'assignments/:assignment_id/edit' => 'assignments#edit', as: :edit_assignment
  patch 'assignments/:assignment_id' => 'assignments#update', as: :assignment
  delete 'assignment/:assignment_id' => 'assignments#destroy', as: :unassign
  
  get 'project_request/:project_request_id/responses/:response_id/edit' => 'responses#edit', as: :edit_project_request_response
  patch 'project_request/:project_request_id/responses/:response_id/edit' => 'responses#update', as: :update_project_request_response
  get 'project_request/:project_request_id/responses/:response_id/comment/new' => 'responses#new_comment', as: :new_comment
  patch 'project_request/:project_request_id/responses/:response_id/comment/new' => 'responses#create_comment', as: :add_comment
  get 'project_request/:project_request_id/responses/:response_id/comment/edit' => 'responses#edit_comment', as: :edit_comment
  patch 'project_request/:project_request_id/responses/:response_id/comment/edit' => 'responses#update_comment', as: :update_comment
  
  get 'home' => 'sessions#new'
  
  get 'signup'  => 'employees#new'
  
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
  resources :groups, :employees, :projects, :departments, :locations, :skills, :titles, :reviews
  
  resources :project_requests do
    resources :responses
  end
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'sessions#new'

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
