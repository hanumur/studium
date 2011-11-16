
# Print the contents of an array of sixteen numbers, four numbers at a time, using just each.
count = 1
(1..16).to_a.each do |x|
    print x, ' '
    puts if count % 4 == 0
    count += 1
end

# Now, do the same with each_slice in Enumerable.
(1..16).to_a.each_slice(4) { |x| puts x.join ' ' }


# The Tree class was interesting, but it did not allow you to specify a new tree with a clean user interface.
# Let the initializer accept a nested structure with hashes and arrays.
# You should be able to specify a tree like this:
# {’grandpa’ => { ’dad’ => {’child 1’ => {}, ’child 2’ => {} }, ’uncle’ => {’child 3’ => {}, ’child 4’ => {} } } }.
class Tree
    attr_accessor :name, :children

    def initialize(hash)
        @name = hash.keys.first
        @children = []
        hash[@name].each { |n, c| @children << Tree.new(n => c) }
    end

    def visit_all(&block)
        visit &block
        children.each {|c| c.visit_all &block}
    end

    def visit(&block)
        block.call self
    end
end

tree = Tree.new(:grandpa => {:dad => {:child1 => {}, :child2 => {}}, :uncle => {:child3 => {}, :child4 => {}}})
tree.visit { |node| puts node.name}
tree.visit_all { |node| puts node.name }


# Write a simple grep that will print the lines of a file having any occurrences of a phrase anywhere in that line.
def grep(filename, phrase)
    puts IO.readlines(filename).select { |line| line =~ /#{phrase}/ }
end

grep('bus.txt', 'go')
