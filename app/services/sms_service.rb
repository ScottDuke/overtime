class SmsService

  TWILIO_ACCOUNT_SID = Rails.application.credentials.twilio[:account_sid]
  TWILIO_AUTH_TOKEN = Rails.application.credentials.twilio[:auth_token]
  
  def initialize(params)
    @phone_number = params.fetch(:phone_number, nil)
    @message = params.fetch(:message, nil)
  end

  def send_sms(number, message)
    puts "sending #{message} to #{message}"
  end

  def valid?
    begin
      puts phone_number
      response = lookup_client.lookups.phone_numbers(phone_number).fetch
      puts response
      response.phone_number
      true
    rescue => e
      puts e.inspect
      if e.try(:code) == 20404
        return false
      else
        puts e.inspect
      end
    end
  end

  private

  attr_reader :phone_number, :message

  def lookup_client
    Twilio::REST::Client.new(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN)
  end

end