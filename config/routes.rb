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
  resources :categories, only: [:index,:show,:edit,:update]
  resources :staffs,only: :index do
    collection do
      resources :categories, only: [:new,:delete]
      get 'categoties/edit_list' => 'categories#edit_list'
    end
  end
  resources :item_list,only: [:index]
  get  'item_list/search' => 'item_list#search'
  post 'item_list/export' => 'item_list#export'
  root 'items#index'
end
