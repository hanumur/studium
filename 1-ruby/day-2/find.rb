
# Find out how to access files with and without code blocks. What is the benefit of the code block?
    # Object will automatically be closed when the block terminates
    # http://ruby-doc.org/core/classes/IO.html#M000877


# How would you translate a hash to an array?
h = { "c" => 300, "a" => 100, "d" => 400, "c" => 300  }
h.to_a   #=> [["c", 300], ["a", 100], ["d", 400]]


# Can you translate arrays to hashes?
["a", 100, "b", 200]
Hash["a", 100, "b", 200]   #=> {"a"=>100, "b"=>200}


# Can you iterate through a hash?
h = { "a" => 100, "b" => 200 }
h.each {|key, value| puts "#{key} is #{value}" }


# You can use Ruby arrays as stacks. What other common data structures do arrays support?
    # Set
