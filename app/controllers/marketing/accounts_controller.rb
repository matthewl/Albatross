module Marketing
  class AccountsController < ApplicationController
    def def new
      @account = Account.new
    end

    def create
      account = Account.new_with_website(account_params)

      if account.save
        # TODO: redirect to the newly created site
        redirect_to marketing_home_path
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