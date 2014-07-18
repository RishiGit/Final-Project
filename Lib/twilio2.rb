require_relative 'scraper_project.rb'
require 'open-uri'
require 'twilio-ruby'
class Messages

  def initialize(to)
    @to = to
  end

  # put your own credentials here
  
  # set up a client to talk to the Twilio REST API
  

  # #Sending SMS
  # @client.account.messages.create(
  #   :from => '+18152642023',
  #   :to => '+19087231020',
  #   :body => 'Hey there!'
  # )


  def send_text
    scraped_data = Scraper.new
    account_sid = 'ACe330ba04d082392df4cb3511dcb72cec'
     auth_token = '2008ea097713e401a16c54029058da82'
     @client = Twilio::REST::Client.new account_sid, auth_token

    # friends = {
    # "+19087231020" => "Rishi",
    # "+14158157775" => "Boots",
    # "+14155551234" => "Virgil"
    # }

    # friends.each do |key,value|
    @client.account.messages.create(
    :from => '+18152642023',
    :to => @to,
    :body => "The joke today is: #{scraped_data.joke}",
    )
  end
end 

# start = Messages.new(19087231020)

