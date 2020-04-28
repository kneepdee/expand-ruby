# Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day.
# It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.

#   > stock_picker([17,3,6,9,15,8,6,1,10])
#   => [1,4]  # for a profit of $15 - $3 == $12
# Quick Tips:

# You need to buy before you can sell
# Pay attention to edge cases like when the lowest day is the last day or the highest day is the first day.

def stock_picker(stock_prices)
  profits = []
  stock_prices_reversed = stock_prices.reverse

  stock_prices_reversed.each_with_index do |price, price_index|
    stock_prices_reversed.each_with_index do |previous_price, previous_price_index|
      profit = price - previous_price unless previous_price_index <= price_index
      # puts "price: #{price} previous_price: #{previous_price} profit #{profit}"
      profits << {
        :profit => profit,
        :buy_day => stock_prices.length - previous_price_index - 1,
        :sell_day => stock_prices.length - price_index - 1
      } unless profit.nil?
    end
  end
  max_profit = profits.max_by{|profit| profit[:profit] }
  [max_profit[:buy_day], max_profit[:sell_day]]
end

p stock_picker([17,3,6,9,15,8,6,1,10])
