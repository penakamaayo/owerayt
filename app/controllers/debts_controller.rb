class DebtsController < ApplicationController


  def show
  end



  def new
    @debt = Debt.new
  end


  def create
    @debt = Debt.new debt_params

    @debt.save ?
      flash[:notice] = "Debt Created." :
      flash[:error] = "Unable to Create Debt."

    redirect_to :back
  end





  private

  def debt_params
    params.require(:debt).permit(:amount, :comment, :owner_id, :payer_id,
      :start_date, :due_date, :paid_date)
  end

end
