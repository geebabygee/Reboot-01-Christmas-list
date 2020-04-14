require_relative 'scraper'
require 'byebug'
require_relative 'csv_methods'
# -------------------------------------------------
# 1. Add the option 'idea' to actions
# 2. If the user selects 'idea', I :
# - ask: which article are you looking for?
# - get the user input, store it in a variable
# - pass that variable to the scraper (method)
# - we display the results that we got from the scraper
# - we ask the user which item they want to add to their giftlist (index)
# - we add the item to our giftlist


def display(list)
  list.each_with_index do |gift_hash, index|
    bought = gift_hash[:bought] ? "[X]" : "[ ]"
    puts "#{index + 1}. #{gift_hash[:name]} #{bought}"
end

end

giftlist = load_csv

# giftlist = [
#   {name: "surfboard", bought: false },
#  ]

action = nil

puts "Welcome to your christmas list"

until action == "quit"
  puts "Which action [list|add|delete|mark|idea|quit]?"
  action = gets.chomp

  case action
  when "list"
    display(giftlist)

  when "add"
    puts "Which gift would you like to add?"
    name = gets.chomp
    gift = {name: name, bought: false}
    giftlist << gift
    print `clear`
  when "delete"
    display(giftlist)
    puts "Which gift would you like to delete? Please give the index"
    index = gets.chomp.to_i - 1
    giftlist.delete_at(index)
    print `clear`
  when "mark"
    display(giftlist)
    puts "Which gift would you like to mark ? Please give the index"
    index = gets.chomp.to_i - 1
    gift = giftlist[index]
    gift[:bought] = true

  when "idea"
    # - ask: which article are you looking for?
    puts "What are you looking for?"
    # - get the user input, store it in a variable
    search = gets.chomp
    # - pass that variable to the scraper (method)
    results = scraper(search)
    # - we display the results that we got from the scraper
    results.each_with_index do |result, index|
      puts "#{index + 1} #{result}"
    end
    # - we ask the user which item they want to add to their giftlist (index)
    puts "Which item do you want to add? Give the index"
    index_gift = gets.chomp.to_i - 1
    name = results[index_gift] # => name of the gift
    # - we add the item to our giftlist
    gift = {name: name, bought: false}
    giftlist << gift

  end
end

save_csv(giftlist)

