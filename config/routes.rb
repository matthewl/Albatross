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
      get "/", to: "home#index", as: "marketing_home"
      get "/sign_up", to: "accounts#new"
      post "/sign_up", to: "accounts#create"
    end
  end

  root "home#index"
end
