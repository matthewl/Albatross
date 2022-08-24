class AccountCreator
  def initialize(params)
    @account_params = params[:account]
  end

  def perform
    create_account
    create_website
  end

  private

  def create_account
    @account = Account.create(name: @account_params.name)
  end

  def create_website
    # TODO: Create website from account_params
  end
end