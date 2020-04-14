require 'csv'

def load_csv
  gifts = []
  csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
  filepath    = 'gifts.csv'

  CSV.foreach(filepath, csv_options) do |row|
    key = row["name"]
    value = row["bought"] == "true" ? true : false

    # if row["bought"] == "true"
    #   value = true
    # else
    #   value = false
    # end

    # TODO: build new gift from information stored in each row
    gift = {name: key, bought: value}
    gifts << gift
  end
  gifts
end

# def save_csv(gifts)
#   csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
#   filepath = 'gifts.csv'

#   CSV.open(filepath, 'wb', csv_options) do |csv|
#     # We add headers to the CSV
#     csv << ['name', 'bought']
#     #TODO: store each gift
#     gifts.each do |gift|
#       csv << [gift[:name], gift[:bought]]
#     end
#   end
# end

def save_csv(gifts)
  csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
  filepath    = 'gifts.csv'

  CSV.open(filepath, 'wb', csv_options) do |csv|
    # We had headers to the CSV
    csv << ['name', 'bought']

    gifts.each do |gift_hash|
      csv << [gift_hash[:name], gift_hash[:bought]]
    end
  end
end

