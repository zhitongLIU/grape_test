Rails.application.routes.draw do
  root 'stocks#index'
  resources :stocks do
    get 'history', on: :member
    put 'edit', on: :member
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount V1::Base => '/'
end
