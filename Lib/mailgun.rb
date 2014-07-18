require_relative 'scraper_project.rb'
require 'open-uri'
require 'mailgun'
require 'mechanize'
class Email


  def initialize(to)
    # (to,subject)s
    @to = to
    # @subject = subject
  end

  # Initialize your Mailgun object:
  Mailgun.configure do |config|
    config.api_key = 'key-06hmkbkeg1jwnkc3rl4-ur1yavzy-bg3'
    config.domain  = 'sandbox7b38f95614714c95a069b463996d9264.mailgun.org'
  end

  
  # def mailing_list
  #   @mailgun = Mailgun()
  #   @mailgun.lists.create("postmaster@sandbox7b38f95614714c95a069b463996d9264.mailgun.org")
  #   @mailgun.list_members.add("postmaster@sandbox7b38f95614714c95a069b463996d9264.mailgun.org", "i.rishikrishnan@gmail.com")
  #   @addresses = @mailgun.list_members.list "postmaster@sandbox7b38f95614714c95a069b463996d9264.mailgun.org"


  def send_my_email
    scraped_data = Scraper.new
    #Sending Email
    @mailgun = Mailgun()
    parameters = {
      :to => @to,
      :subject =>  "News for the day",
      :text => scraped_data.news,
      :from => "rishi_krishnan@sandbox7b38f95614714c95a069b463996d9264.mailgun.org"
    }
    @mailgun.messages.send_email(parameters)
  end
end

# email = Email.new("i.rishikrishnan@gmail.com" , "This is an email from Rishi")
# email.send_my_email

# email = Email.new("i.rishikrishnan@gmail.com" )

