require 'open-uri'
require 'nokogiri'

# SCRAPER (lib/scraper.rb) / create a method scraper(article)
# -----------------------------------------------------------

# 1) We make a request to the url where we pass the query
# 2) We parse the HTML with the nokogiri gem (gem install nokogiri)
# 3) We search the HTML document for css selectors (the html tags have classes, and we can find the information based on those classes)
# 4) when we find the correct element (title of the article), we want to add it to an array
# 5) the scraper should return an array of results to the user


def scraper(search)
  # 1. We get the HTML page content thanks to open-uri
  html_content = open("https://www.etsy.com/search?q=#{search}").read

  # 2. We build a Nokogiri document from this file
  doc = Nokogiri::HTML(html_content)

  # 3. We search for the correct elements containing the items' title in our HTML doc

  doc.search('.v2-listing-card .v2-listing-card__info .text-body').first(10).map do |element|
    # 4. For each item found, we extract its title and print it
     # element.text.strip
     title = element.text.strip
     title.split.slice(0, 4).join(" ")
  end
end



