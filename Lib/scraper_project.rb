# html = open('http://newday.blogs.cnn.com/category/headlines/5-things-to-know-for-your-new-day/')
require 'open-uri'
require 'mechanize'

class Scraper

  def initialize
    @news = self.scrape_news
    @joke = self.scrape_joke
  end


  def scrape_news
    agent = Mechanize.new
    page = agent.get("http://newday.blogs.cnn.com/category/headlines/5-things-to-know-for-your-new-day/")
    nokogiri_doc = Nokogiri::HTML(open("#{page.uri}"))
    nokogiri_doc.css('.cnnBlogContentTitle a').first.attributes["href"].value
    click_link = page.at("a[rel='bookmark']")
    page2 = agent.click(click_link)  
    nokogiri_doc2 = Nokogiri::HTML(open("#{page2.uri}"))
    nokogiri_doc2.css('.cnnBlogContentPost p')
  end

  def scrape_joke 
    html_joke = open('http://jokes.cc.com')
    nokogiri_jokes = Nokogiri::HTML(html_joke)
    nokogiri_jokes.css(".middle .fulltext").children.text.strip
    daily_joke = nokogiri_jokes.css(".middle .fulltext").children.text.strip 
  end

  def news
    @news
  end

  def joke
    @joke
  end


# agent = Mechanize.new
# page = agent.get("http://newday.blogs.cnn.com/category/headlines/5-things-to-know-for-your-new-day/")
# html = page.body
end

scraped_data = Scraper.new

puts scraped_data.joke
puts scraped_data.news
