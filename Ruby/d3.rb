class CsvRow
 attr_accessor :headers, :datas
 
 def initialize(headers,datas)
  @headers = headers
  @datas = datas
 end
 
 def method_missing name, *args
  datas[headers.find_index name.to_s]
 end
end
module ActsAsCsv
 def self.included(base)
  base.extend ClassMethods
 end

 module ClassMethods
  def acts_as_csv
   include InstanceMethods
  end
 end

 module InstanceMethods
  def read
   @csv_contents = []
   filename = self.class.to_s.downcase + '.csv'
   file = File.new(filename)
   @headers = file.gets.chomp.split(',')

   file.each do |row|
    @csv_contents << CsvRow.new(headers,row.chomp.split(','))
   end
  end
  
  def each(&block)
   csv_contents.each do |row|
    block.call row
   end
  end
  
  attr_accessor :headers, :csv_contents

  def initialize
   read
  end

 end

end

class RubyCsv
 include ActsAsCsv
 acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect
m.each {|row| puts row.name }

puts "===================="
def yieldTest
 puts "begin yield"
 a = yield
 puts "#{a} end"
end

yieldTest do 
 puts "say love!"
 "over"
end

puts "===================="
class Magic
 def self.writeMethod
  define_method "magic" do
   puts "fire"
  end
  define_method "initialize" do
   puts "init"
  end
 end
end

class Man < Magic
 writeMethod

 def fuck
  puts "fuck"
 end
end

man = Man.new
man.fuck
man.magic

puts "==============="
class Print
 def print
  puts "self.print"
 end
 def self.print
  puts "Self.print"
 end
end

Print.print
Print::print
out = Print.new
out.print
out::print

