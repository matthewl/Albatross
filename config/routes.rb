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
    scope module: 'marketing' do
      get '/', to: 'home#index'
    end
  end
end
