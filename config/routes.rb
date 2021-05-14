Rails.application.routes.draw do

  namespace :users do
    get 'rooms/show'
  end
  get 'room/show'
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  namespace :admins do
    resources :users, only:[:index, :show]
    patch '/users/:id/ban' => 'users#ban'
    patch '/users/:id/unban' => 'users#unban', as: 'unban'
    resources :reports, only:[:index, :show]
    resources :requests, only:[:index, :show]
    resources :tickets, except:[:new, :show]
  end

  devise_for :users, controllers: {
  	registrations: 'users/registrations',
  	sessions: 'users/sessions'
  }

  root 'home#top'
  get '/about' => 'home#about'

  namespace :users do
    patch '/users/:id/withdraw' => 'users#withdraw', as: 'withdraw'
  	resources :users, except:[:new, :create] do
      resources :reports, only:[:new, :create]
      resources :request_histories, only: :index
      resources :participant_histories, only: :index
      resources :keeps, only: :index
      resources :evaluations, only: :index
    end
  	resources :requests do
  		resources :participants, only:[:create, :destroy]
      resources :rooms, only: :show
      resources :keeps, only:[:create, :destroy]
      resources :another_evaluations, only:[:index, :new, :create]
  	end
    resources :participants do
      resources :evaluations, only:[:new, :create]
    end
    resources :purchases, only:[:index, :new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
