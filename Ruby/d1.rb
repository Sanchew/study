puts "game begin"
r = true
while r
 m=rand(10)
 puts "please input number:"
 i = gets.to_i
 if i == m 
  puts "bingo"
 elsif i > m 
  puts "big"
 else 
  puts "small"
 end 
 puts "continue?"
 i = gets
 if i != "y\n"  
  r = false
 end
end
