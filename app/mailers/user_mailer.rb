class UserMailer < ApplicationMailer
  def welcome
    # @user = params[:user]
    # mail(to: @user.email, subject: 'Welcome to Festeam')
       mail(
      :subject => 'Hello from Postmark',
      :to  => 'contact@festeam.io',
      :from => 'contact@festeam.io',
      :html_body => '<strong>Hello</strong> dear Postmark user.',
      :track_opens => 'true')
  end

  def send_invitation(group)
    @users = group.email

    mail(
      to:       @users,
      subject:  "Welcome and join to your group"
    )
  end
end
