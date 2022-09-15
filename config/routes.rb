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

      resources :themes, only: [:index]

      get "/", to: "home#index", as: "marketing_home"
    end
  end

  namespace :admin do
    get "/", to: "dashboard#index", as: :root

    resources :headers, only: %i[edit update]
    resources :websites, only: %i[edit update]
  end

  root "home#index"
end
