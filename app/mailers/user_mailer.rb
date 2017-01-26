class UserMailer < ActionMailer::Base
  default from: "goodmemes.launch@gmail.com"

  def notice(review)
    @review = review
    if @review.meme.user
      @user = @review.meme.user.email
      mail(to: review.meme.user.email , subject: "New review posted for #{@review.meme.name}")
    end
    @greeting = "Your meme has been reviewed!"
  end
end
