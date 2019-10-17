Rails.application.routes.draw do
	devise_for :models
	devise_for :users
	resource :dashboard, only: [:show]
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root 'static_pages#index'
	get 'privacy', to: 'static_pages#privacy'
	
	get 'about', to: 'static_pages#about'
	get 'team', to: 'static_pages#team'
	get 'career', to:'static_pages#career'
	get 'contact', to: 'static_pages#contact'
	resources :courses, only: [:index, :show] do
		resources :enrollments, only: :create
	end
	resources :lessons, only: [:show]
	namespace :instructor do
		resources :lessons, only: [:update]
		resources :sections, only: [:update, :show] do
			resources :lessons, only: [:create]
		end
		resources :courses, only: [:new, :create, :show] do
		  resources :sections, only: [:create]
		end
	end
end
