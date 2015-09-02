class OwerightMailer < ActionMailer::Base

  default :from => 'support@oweright.yea'


  def notify_payer debt
    @debt = debt
    @payer = debt.payer
    @owner = debt.owner

    mail :to => @payer.email, :subject => 'OWERIGHT: New Debt Notification'
  end


  def send_contact_invitation email, user
    @user = user
    @email = email

    mail :to => @email, :subject => 'OWERIGHT: Invitation'
  end

end
