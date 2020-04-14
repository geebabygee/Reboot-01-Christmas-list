# STEP 2: LIST, ADD, DELETE
# --------------------------------------
# 1. Implement the actions:

# 2. LIST: we want to display all the gifts, in a nice format
# - go over the list and display one by one with index

# 3. ADD: we want to add something to our gift_list
# - ask the user for input
# - store the gift in the list

# 4. DELETE: we want to remove something from our list
# - display gifts
# - ask for index
# - find gift in list
# - delete gift

giftlist = ["surfboard", "puppy"]
action = nil

puts "Welcome to your christmas list"

until action == "quit"
  puts "Which action [list|add|delete|quit]?"
  action = gets.chomp

  case action
  when "list"
    giftlist.each_with_index do |gift, index|
      puts "#{index + 1}. #{gift.capitalize}"
    end
  when "add"
    puts "Which gift would you like to add?"
    gift = gets.chomp
    giftlist << gift
  when "delete"
    giftlist.each_with_index do |gift, index|
      puts "#{index + 1}. #{gift.capitalize}"
    end
    puts "Which gift would you like to delete? Please give the index"
    index = gets.chomp.to_i
    giftlist.delete_at(index - 1)
  when "quit"
    break
  end
end

puts "Bye, thank you!"
