Rails.application.routes.draw do
  #devise_for :users
  
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # devise_for :users, controllers: { sessions: 'users/sessions' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "home#index"

   get 'contacts/new'
   post 'contacts/create'
   get 'contacts/list'
   patch 'contacts/update'
 
   post 'contacts/list'
   get 'contacts/show'
   get 'contacts/update'
   get 'contacts/edit'
   get 'contacts/delete'
   post 'contacts/delete'
   post 'contacts/edit'
   get 'contacts/test'
   post 'contacts/test'
   get "send_email" => "contacts#send_email" 
   post "send_email" => "contacts#send_email"
   get 'contacts/email_page'

  get 'picture/new'
  post 'picture/create'
  get 'picture/create'
  get 'picture/delete'
  post 'picture/delete'
  get 'picture/list'

  get 'home/index'
  get 'home/details'
 

end
