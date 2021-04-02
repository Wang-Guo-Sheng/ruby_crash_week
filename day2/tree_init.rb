class Tree
    attr_accessor :children, :node_name

    def initialize(nested)
        nested = nested.to_h
        @node_name = nested.keys[0]
        @children = []
        nested[node_name].each do |name, value|
            children.append(Tree.new({name => value}))
        end
    end

    def visit_all(&block)
        visit &block
        children.each {|c| c.visit_all &block}
    end

    def visit(&block)
        block.call self
    end
end


h = {'grandpa' => {'dad' => {'child1' => {}, 'child2' => {}}, 'uncle' => {'cousin1' => {}, 'cousin2' => {}}}}

ruby_tree = Tree.new(h)

puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts

puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}
