require "csv"

def calc_avg_price(prices)
	total = 0.0
	prices.each do |price|
		total = total + price.to_f
	end

	average = (total / prices.length).round(2)

	
end

def total_size_volume(sizes)
	total = 0.0
	sizes.each do |size|
		total = total + size.to_f
	end

	total.round(2)
end

def total_usd_volume(sizes, prices)
	total = 0.0
	prices.each_with_index do |price, index|
		total = total + (price.to_f * sizes[index].to_f)
	end

	total.round(2)
end
data = CSV.read("fills.csv", headers: true)

avg_price = calc_avg_price(data.by_col["price"])
size_vol = total_size_volume(data.by_col["size"])
total_usd = total_usd_volume(data.by_col["size"], data.by_col["price"])

puts data[0]["product"]
puts "==============="
puts "Average Price: $" + avg_price.to_s
puts "Total #{data[0]["product"].split("-")[0]} Volume: " + size_vol.to_s
puts "Total volume in USD: $"+total_usd.to_s



