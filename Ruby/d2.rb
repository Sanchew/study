arr = []
16.times { arr.push rand(100) }
tmp = []
arr.each do |a|
 tmp.push(a)
 if tmp.length == 4 
  puts "#{tmp},"
  tmp = []
 end
end
puts "---------------"
arr.each_slice(4) {|a| puts "#{a}," }
puts "================"
class Tree
 attr_accessor :children,:node_name
=begin
 def initialize(name, children=[])
  @children = children
  @node_name = name
 end
=end
 def initialize(tree={})
  tree.each do |k,v|
   @node_name = k
   @children = v.map {|sk,sv| Tree.new({sk => sv}) }
  end
 end
 
 def visit_all(&block)
  visit &block
  children.each {|c| c.visit_all &block }
 end

 def visit(&block)
  block.call self
 end
end

tree = Tree.new({'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {} } } })


tree.visit_all {|node| puts node.node_name }

puts "========================"
File.open('doc','r') do |f|
 while line = f.gets
  puts line if line[/you/]
 end
end
