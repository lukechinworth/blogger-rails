class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :body, presence: true

  before_create :send_notification

  private

  def send_notification
    begin
      response = RestClient::Request.new(
        method: :post,
        url: "https://api.twilio.com/2010-04-01/Accounts/#{ENV['TWILIO_ACCOUNT_SID']}/Messages.json",
        user: ENV['TWILIO_ACCOUNT_SID'],
        password: ENV['TWILIO_AUTH_TOKEN'],
        payload: {
          Body: " commented on your post, ",
          To: self.post.user.phone_number,
          From: 5005550006
        }
      ).execute

    rescue RestClient::BadRequest => error
      # binding.pry
      message = JSON.parse(error.response)['message']
      errors.add(:base, message)
      false
    end
  end
end
