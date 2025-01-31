class AccountsController < ApplicationController
  before_action :set_account, only: %i[ show edit update destroy ]

  def index
    @accounts = Current.user.accounts
  end

  def show
  end

  def new
    @account = Current.user.accounts.new
  end

  def edit
  end

  def create
    @account = Current.user.accounts.new(account_params)

    if @account.save
      redirect_to @account, notice: "Account was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @account.update(account_params)
      redirect_to @account, notice: "Account was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @account.destroy!
    redirect_to accounts_path, notice: "Account was successfully destroyed.", status: :see_other
  end

  private
    def set_account
      @account = Current.user.accounts.find(params.expect(:id))
    end

    def account_params
      params.expect(account: [ :name, *Account::SETTINGS_FIELDS ])
    end
end
