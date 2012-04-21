AjoCms::Engine.routes.draw do
	root :to => "sections#index"
	match '../', :to => "ajo_cms/views#index", :as => :rails_app_root
	resources :users do
		get :first_user, :on => :collection
	end
	resources :sessions, :only => [:new, :create]
	match 'logout' => 'sessions#destroy', :as => 'logout'
	resources :companies
	resources :sections do
		resources :pages do
			resources :posts
		end
	end
	Rails.application.routes.draw do
		root :to => "ajo_cms/views#index"
		match '/:section_name/:page_name', :to => 'ajo_cms/views#section'
		match '/:section_name', :to => 'ajo_cms/views#section'
	end
	
end


