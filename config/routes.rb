AjoCms::Engine.routes.draw do
	root :to => "sections#index"
	resources :companies
	resources :sections do
		resources :pages
	end
end

Rails.application.routes.draw do
	root :to => "ajo_cms/views#index"
	match '/:section_name/:page_name', :to => 'ajo_cms/views#section'
	match '/:section_name', :to => 'ajo_cms/views#section'

end
