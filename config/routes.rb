Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user  do
    get 'users/registrations/done' => 'registrations#done' #本当はresources :usersにネストしたい
  end

  resources :users, only: [:index, :edit, :update] do
    collection do
      resource :card, only: [:new, :show, :destroy, :create], module: "users"
      resource :card, only: [:new, :create], path: "registrations/card", module: "users/registrations"
      resource :street_address, only: [ :new, :create, :edit, :update]
      resource :vendor, only: [ :new, :create, :edit, :update]
      get 'register_user_top'
      get 'logout'
    end
  end
  resources :items do
    resources :item_comments,only: [:create]
    resource :deal, only: [:new, :create], module: "items" do
      resource :card, except: [:edit, :update], module: "deals"
      collection do
        get 'done'
      end
    end
    collection do
      get 'search'
    end
  end
  resources :categories, only: [:index,:show]
  root 'items#index'
end
