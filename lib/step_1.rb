# # PSEUDOCODE CHRISTMAS LIST

# ruby interface.rb

# > Welcome to your Christmas gift list
# > Which action [list|add|delete|quit]?
# > list
# > TODO: list items
# > Which action [list|add|delete|quit]?
# > add
# > TODO: ask user an item and add it to gift list
# > Which action [list|add|delete|quit]?
# > delete
# > TODO: ask user the index of item to delete and delete it
# > Which action [list|add|delete|quit]?
# > quit
# > Goodbye

# STEP 1: MAKE IT LOOP
# -------------------------------------
# giftlist = []

# 1. Greet the user
# 2. Display the actions to the user
# 3. Ask the user which action they want to do
# 4. IF action:
# - list:
# - add:
# - delete:
# - quit: we quit the loop

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
  end
end



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
