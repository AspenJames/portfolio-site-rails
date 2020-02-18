Rails.application.routes.draw do
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	root :to => 'static#about'
	get '/resume', :to => 'static#resume'

	get '/projects', :to => 'projects#index'
	get '/projects/:slug', :to => 'projects#detail'
end
