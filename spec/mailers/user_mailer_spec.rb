require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "notice" do
    bob = User.create(email: "bob@123.com", password: "meme123", username: "bob", id: 500, admin: false)
    barb = User.create(email: "youknowitbarb@bigbarb.com", password: "bigbarb", username: "littlebarb", admin: true)
    sk = Category.create(name: "Sucess Kid", image_url: "http://cdn-aws-01.mummypages.co.uk/images/3788/189/9/1_1/kid.jpg", id: 3)
    fri = Meme.create(name: "It's Friday", img_url: "http://i.dailymail.co.uk/i/pix/2016/03/18/17/32570AD700000578-3498922-image-a-73_1458323147637.jpg", category: sk, user_id: 500, category_id: 3)
    review = Review.create(rating: 5, body: "You always earned pizza!", user: barb, meme: fri)
    let(:mail) { UserMailer.notice(review) }

    it "renders the headers" do
      expect(mail.subject).to eq("New review posted for It's Friday")
      expect(mail.to).to eq([review.meme.user.email])
      expect(mail.from).to eq(["goodmemes.launch@gmail.com"])
    end
  end
end
