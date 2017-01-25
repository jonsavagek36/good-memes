class UserMailer < ActionMailer::Base
  default from: "goodmemes.launch@gmail.com"

  def notice(review)
    @review = review
    @user = @review.meme.user.email
    @greeting = "Your meme has been reviewed!"

    mail(to: review.meme.user.email , subject: "New review posted for #{@review.meme.name}")
  end
end
