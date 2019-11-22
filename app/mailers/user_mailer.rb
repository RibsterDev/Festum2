class UserMailer < ApplicationMailer
  def welcome
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to Festeam')
    # mail(
    #   subject: 'Hello from Postmark',
    #   to: 'contact@festeam.io'
    # )
  end

  def send_invitation
    @users = params[:group].email

    mail(
      to:       @users,
      subject:  "Welcome and join to your group"
    )
  end
end
