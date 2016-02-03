class UserMailer < ActionMailer::Base
  default from: "root@admin.com"

  def delete_notif_email(user)
    @user = user
    mail(to: @user.email,
      subject: "You have been a'deleted!")
  end
end
