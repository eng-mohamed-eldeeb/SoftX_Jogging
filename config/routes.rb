Rails.application.routes.draw do
  
  
  get 'user_admin/create'
  devise_for :users, path: '', path_names: {
    sign_in: 'login', 
    sign_out: 'logout', format: 'json',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  # =======================================================================================================
  
  resources :jogging_times
  
  # =======================================================================================================
  
  get 'current_user', to: 'current_user#index'
  
  # =======================================================================================================
  
  # admin routes
  post 'jogging_times/add-jogging-times-to-user', to: 'jogging_times#add_records_to_user_by_admin'
  put 'jogging_times/update-jogging-times-to-user/:id', to: 'jogging_times#update_a_user_records_by_admin'
  get 'jogging_times/show-jogging-times-to-user/:user_id', to: 'jogging_times#show_user_records_by_admin'
  delete 'jogging_times/remove-jogging-times-to-user/:id', to: 'jogging_times#remove_records_from_user_by_admin'
  # =======================================================================================================

  
  # =======================================================================================================
  
  # admin and user_manager routes
  
  post 'users/create', to: 'users#create'
  put 'users/update/:id', to: 'users#update'
  get 'users/show/:id', to: 'users#show'
  delete 'users/destroy/:id', to: 'users#destroy'
  
  # =======================================================================================================

  get 'users/filter_jogging_times_by_dates', to: 'users#filter_jogging_times_by_dates'

  get 'users/weekly_report/:id', to: 'users#weekly_report'
  
end
