Rails.application.routes.draw do
  #resources :phases

  root "home#home1"
  get "phases/phase1"
  get "phases/phase2"
  get "phases/phase3"
  get 'home/about'
  get 'home/contact'
  get 'pstaffs/showuser'
  get 'home/index'

  get 'pstaffs/tstaff_new'
  get 'pstaffs/phdstaff_new'
  get 'pstaffs/vender_new'
  get 'pstaffs/others_new'

  resources :pstaffs

  devise_scope :user do
  	delete 'sign_out', to: 'devise/sessions#new'
  end

  devise_for :users, controllers: { registrations: "registrations" }


  resources :users


  get "check/phase1"
  get "check/phase2"
  get "check/phase3"
  #get "check/sticker"
  post "request/approve/:id" , :action=>"approve",:controller=>"check",:as=>"approve"  
  post "request/disapprove/:id" , :action=>"disapprove",:controller=>"check",:as=>"disapprove"  

  post'request/check/:id' => 'check#create', :action=> "create", :controller=>"check" ,:as => 'check'


   
   match '/check',      to: 'check#new',           via: 'get'
   match '/check',      to: 'check#create',        via: 'post'


  get '/search' => 'check#search', :action=> "search", :controller=>"check" ,:as => 'search_page'
  get :approve_mail, to: 'notification#approve_mail', as: :approve_mail
  get :recive_mail, to: 'notify#recive_mail', as: :recive_mail
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
