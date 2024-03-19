Rails.application.routes.draw do
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # 顧客用
  scope module: :public do
    root to: "homes#top"
    get "/about" => "homes#about"
    resources :items, only: [:index, :show]
    namespace :customers do
      get   "/my_page"          => :show
      get   "/information/edit" => :edit
      patch "/information"      => :update
      get   "/unsubscribe"      => :unsubscribe
      patch "/withdraw"         => :withdraw
    end
    resources :cart_items, only: [:index, :update, :create, :destroy] do
      delete "destroy_all", on: :collection
    end
    resources :orders, only: [:new, :create, :index, :show] do
      post "confirm", on: :collection
      get "thanks", on: :collection
    end
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end

  # 管理者用
  namespace :admin do
    root to: "homes#top"
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
