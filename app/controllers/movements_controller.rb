class MovementsController < ApplicationController
  before_action :set_movement, only: %i[ show edit update destroy ]
  before_action :set_account, only: %i[ index show new edit ]

  def index
    @movements = @account.movements
  end

  def show
  end

  def edit
  end

  def update
    if @movement.update(movement_params)
      redirect_to @movement, notice: "Movement was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @movement.destroy!
    redirect_to @movement.account, notice: "Movement was successfully destroyed.", status: :see_other
  end

  private
    def set_account
      account_id = params[:account_id]

      if account_id
        @account = Account.find(account_id)
      else
        @account = @movement.account
      end
    end

    def set_movement
      @movement = Movement.find(params.expect(:id))
    end

    def movement_params
      params.expect(movement: [ :verified ])
    end
end
