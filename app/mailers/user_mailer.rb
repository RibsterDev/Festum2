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
    @email = params[:email]
    @group = params[:group]

    mail(
      to: @email,
      subject: "Welcome and join to your group"
    )
  end
end
