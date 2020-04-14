
def display(gifts)
  gifts.keys.each_with_index do |gift, index|
    bought = gifts[gift] ? "[X]" : "[ ]"
    puts "#{index + 1}. #{gift} #{bought}"
  end
end
