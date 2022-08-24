module Marketing
  class AccountsController < ApplicationController
    def def new
      @account = Account.new
    end

    def create
      account = Account.new_with_website(account_params)

      if account.save
        website_url = account.websites.first.host_url(platform_host)
        redirect_to website_url, allow_other_host: true
      else
        @account = account
        render :new, status: :unprocessable_entity
      end
    end

    private

    def account_params
      params.require(:account).permit(:name, :subdomain)
    end
  end
end