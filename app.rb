require 'bundler' #require bundler
Bundler.require #require everything in bundler in gemfile
require_relative './Lib/mailgun.rb'
require_relative './Lib/scraper_project.rb'
require_relative './Lib/twilio2.rb'


get '/' do 
  @joke = Scraper.new.joke
  @news = Scraper.new.news
  erb :index
end

post '/' do
  if params[:user] != nil
    @send_message = Messages.new(params[:user])
    @send_message.send_text
  end
  if params[:email] != nil
    @send_email = Email.new(params[:email])
    @send_email.send_my_email
  end
  @joke = Scraper.new.joke
  @news = Scraper.new.news
  erb :index
end

# post '/' do
#   @send_email = Email.new(params[:email])
#   @joke = Scraper.new.joke
#   @news = Scraper.new.news
#   erb :index
# end