class MarketingListConstraint
  def initialize
    @ips = RestrictedList.retrieve_ips
  end

  def matches?(request)
    @ips.include?(request.host)
  end
end

Rails.application.routes.draw do
  constraints(MarketingListConstraint.new) do
    scope module: "marketing" do
      get "/sign_up", to: "accounts#new"
      post "/sign_up", to: "accounts#create"

      get "/themes/desert", to: "themes#desert"
      get "/themes/links", to: "themes#links"
      get "/themes/parkland", to: "themes#parkland"

      get "/", to: "home#index", as: "marketing_home"
    end
  end

  namespace :admin do
    get "/", to: "dashboard#index", as: :root

    resources :enquiries do
      member do
        put "open"
        put "close"
      end
    end
    resources :enquiry_forms
    resource :footers, only: [:edit, :update]
    resources :headers, only: %i[edit update]
    resources :posts
    resources :websites, only: %i[edit update]
  end

  resources :enquiries, only: :create
  resources :posts, only: %i[show]

  root "home#index"
end
