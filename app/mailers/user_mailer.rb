class UserMailer < ApplicationMailer
  def welcome
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to Festeam')
  end

  def send_invitation(group)
    @users = group.email

    mail(
      to:       @users,
      subject:  "Welcome Bitch"
    )
  end
end
