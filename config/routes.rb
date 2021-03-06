Xhero::Application.routes.draw do
  
  get "home", to:"home#index"
  get "welcome/index"
  post "welcome/login"
  get "welcome/index"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  namespace "apps" do
    resources :users, :remessages, :replies

    post "remessages/del", to: "remessages#destroy_all"

  end

  get "weixin/io",  to: "weixin/weixins#auth"

  scope path: "/weixin", via: :post do
    #match 'io', to:  'weixin/weixins#reply_text', constraints: lambda {|request| request.params[:xml].nil? }

    
    match 'io', to: 'weixin/weixins#reply_text_info', constraints: Weixin::Router.new(type: "text") {|xml| xml[:Content].starts_with? "1"}
    match 'io', to: 'weixin/weixins#reply_text_news', constraints: Weixin::Router.new(type: "text") {|xml| xml[:Content].starts_with? "2"}
    match 'io', to: 'weixin/weixins#reply_music', constraints: Weixin::Router.new(type: "text") {|xml| xml[:Content].starts_with? "3"}
    match 'io', to: 'weixin/weixins#reply_text_welcome', constraints: Weixin::Router.new(type: "text")

    # match 'io', to: 'weixin/weixins#reply_image', constraints: Weixin::Router.new(type: "image")
  end
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
