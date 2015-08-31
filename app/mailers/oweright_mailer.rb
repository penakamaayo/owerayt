class OwerightMailer < ActionMailer::Base

  default :from => 'support@oweright.yea'


  def notify_payer debt
    @debt = debt
    @payer = debt.payer
    @owner = debt.owner

    mail :to => @payer.email, :subject => 'New Debt Notification: OWERIGHT'

  end

end
