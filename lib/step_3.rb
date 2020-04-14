# Step 3: Mark as bought

# 1. We need to remodel our giftlist to a hash
# 2. We need to display the extra action 'mark'
# 3. Change the way we:
# - display our list
# - add something to our list
# - delete something to our list
# 4. We need to add the logic for the mark
# MARK:
# - display the gifts
# - ask for the index
# - we need to find the gift with the index
# - change the status of the gift to true


def display(list)
  list.each_with_index do |gift_hash, index|
    bought = gift_hash[:bought] ? "[X]" : "[ ]"
    puts "#{index + 1}. #{gift_hash[:name]} #{bought}"
end

end

giftlist = [
  {name: "surfboard", bought: false },
 ]

action = nil

puts "Welcome to your christmas list"

until action == "quit"
  puts "Which action [list|add|delete|mark|quit]?"
  action = gets.chomp

  case action
  when "list"
    display(giftlist)

  when "add"
    puts "Which gift would you like to add?"
    name = gets.chomp
    gift = {name: name, bought: false}
    giftlist << gift

  when "delete"
    display(giftlist)
    puts "Which gift would you like to delete? Please give the index"
    index = gets.chomp.to_i - 1
    giftlist.delete_at(index)

  when "mark"
    display(giftlist)
    puts "Which gift would you like to mark ? Please give the index"
    index = gets.chomp.to_i - 1
    gift = giftlist[index]
    gift[:bought] = true
  end
end




