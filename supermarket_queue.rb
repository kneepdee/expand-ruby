# https://www.codewars.com/kata/57b06f90e298a7b53d000a86
#
# There is a queue for the self-checkout tills at the supermarket. Your task is write a function to calculate the total time required for all the customers to check out!

# input
#
# customers: an array of positive integers representing the queue. Each integer represents a customer, and its value is the amount of time they require to check out.
# n: a positive integer, the number of checkout tills.
#
# Output
#
# The function should return an integer, the total time required.
#
# Examples
#
# queue_time([5,3,4], 1)
#
# should return 12
# because when n=1, the total time is just the sum of the times
#
# queue_time([10,2,3,3], 2)
#
# should return 10
# because here n=2 and the 2nd, 3rd, and 4th people in the
# queue finish before the 1st person has finished.
#

# Solution
def queue_time(customers, n)
  queues = {}

  (0...n).each do |i|
    queues[i] = []
  end

  customers.each do |customer|
    shortest_queue = find_shortest_queue(queues)
    shortest_queue.push(customer)
  end

  queues.reduce([]) { |acc, (key, val)| acc.push(val.sum) }.max
end

def find_shortest_queue(queues)
  shortest_queue_key = queues.min_by { |k, v| v.sum }[0]
  queues[shortest_queue_key]
end

def assert_equals(expression, expected_result)
  if expression == expected_result
    puts 'Test case passed'
  else
    puts 'Test case failed'
  end
end

assert_equals(queue_time([], 1), 0)
assert_equals(queue_time([5], 1), 5)
assert_equals(queue_time([2], 5), 2)
assert_equals(queue_time([1, 2, 3, 4, 5], 1), 15)
assert_equals(queue_time([1, 2, 3, 4, 5], 100), 5)
assert_equals(queue_time([2, 2, 3, 3, 4, 4], 2), 9)
