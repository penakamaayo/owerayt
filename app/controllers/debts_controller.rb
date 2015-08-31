class DebtsController < ApplicationController


  def index
    @debts =
      (params[:owner] == 'theirs') ?
        current_user.their_debts :
        current_user.own_debts
  end



  def new
    @debt = Debt.new
  end


  def create
    attributes = debt_params.clone

    unless self.params_valid? attributes
      flash[:error] = 'Unable to Create Debt. Please fillup required fields.'
      return redirect_to(:back)
    end

    self.check_owner attributes

    @debt = Debt.new attributes


    @debt.save ?
      flash[:notice] = 'Debt Created.' :
      flash[:error] = 'Unable to Create Debt.'

    redirect_to :back
  end





  protected

  def params_valid? attributes
    attributes[:owner_id].present? || attributes[:payer_id].present?
  end


  def check_owner attributes
    if  attributes[:owner_id].blank?
      attributes[:owner_id] = current_user.id
    elsif attributes[:payer_id].blank?
      attributes[:payer_id] = current_user.id
    end

    attributes
  end







  private

  def debt_params
    params.require(:debt).permit(:amount, :comment, :owner_id, :payer_id,
      :start_date, :due_date, :paid_date, :paid)
  end

end
