# frozen_string_literal: true

class SmsService
  TWILIO_ACCOUNT_SID = Rails.application.credentials.twilio[:account_sid]
  TWILIO_AUTH_TOKEN = Rails.application.credentials.twilio[:auth_token]
  TWILIO_NUMBER = Rails.application.credentials.twilio[:phone_number]

  def initialize(params)
    @phone_number = params.fetch(:phone_number, nil)
    @message = params.fetch(:message, nil)
  end

  def send_sms
    body = "Hi, #{message}"
    client.messages.create(
      from: TWILIO_NUMBER,
      to: phone_number,
      body: body
    )
  end

  def valid?
    response = client.lookups.phone_numbers(phone_number).fetch
    response.phone_number
    true
  rescue => e
    if e.try(:code) == 20404
      false
    else
      puts e.inspect
    end
  end

  private

  attr_reader :phone_number, :message

  def client
    Twilio::REST::Client.new(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN)
  end
end
