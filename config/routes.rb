ActionController::Routing::Routes.draw do |map|
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.resources :users

  map.resource :session

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end
  
  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end
  
  map.namespace :management do |management|
    management.root :controller => "home"
    management.resources :products, :collection => { :get_actors => :get }
    management.resources :orders
    management.resources :categories
  end
  
  map.resources :products
  
  map.dvd '/movies/dvd/:id', :controller => "movies", :action => "dvd"
  map.dvds '/movies/dvd', :controller => 'movies', :action => 'dvd'
  map.dvd_category '/movies/dvd/categories/:category_id', :controller => "movies", :action => "dvd_categories"
  
  map.bluray '/movies/bluray/:id', :controller => "movies", :action => "bluray"
  map.blurays '/movies/bluray', :controller => 'movies', :action => 'bluray'
  map.bluray_category '/movies/bluray/categories/:category_id', :controller => "movies", :action => "bluray_categories"

  map.game '/games/item/:id', :controller => "games", :action => "item"
  map.games '/games', :controller => "games"
  map.game_category '/games/categories/:category_id', :controller => "games", :action => "categories"

  map.music '/music/item/:id', :controller => "music", :action => "item"
  map.musics '/music', :controller => "music"
  map.music_category '/music/categories/:category_id', :controller => "music", :action => "categories"
  
  map.toy '/toys/item/:id', :controller => "toys", :action => "item"
  map.toys '/toys', :controller => "toys"
  map.toy_category '/toys/categories/:category_id', :controller => "toys", :action => "categories"  
      
  #map.dvd_categories '/movies/dvd/category', :controller => "movies", :action => "dvd_all_categories"
  #map.bluray_categories '/movies/bluray/categories', :controller => "movies", :action => "bluray_all_categories"
  
  map.cart "/cart", :controller => "cart"
  
  
  
  map.resources :categories
  
  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "store", :action => "index"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
