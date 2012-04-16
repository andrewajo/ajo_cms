AjoCms::Engine.routes.draw do
	root :to => "sections#index"
	resources :users do
		get :first_user, :on => :collection
	end
	resources :sessions, :only => [:new, :create, :destroy]
	resources :companies
	resources :sections do
		resources :pages
	end
end

Rails.application.routes.draw do
	root :to => "ajo_cms/views#index", :as => :application_root
	match '/:section_name/:page_name', :to => 'ajo_cms/views#section'
	match '/:section_name', :to => 'ajo_cms/views#section'

end
