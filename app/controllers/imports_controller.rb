class ImportsController < ApplicationController
  before_action :set_account, only: [ :new, :create ]

  def new
    @import = @account.imports.new
  end

  def create
    @import = @account.imports.new(import_params)

    if @import.save
      redirect_to account_movements_path(@account), notice: "File was successfully uploaded. You'll see the movements in your account once they've been imported."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def set_account
      @account = Account.find(params[:account_id])
    end

    def import_params
      params.expect(import: [ :file ])
    end
end
