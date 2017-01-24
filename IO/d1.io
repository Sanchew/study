"hello, world!" println
man := Object clone
man say := method("I have a " println)
man say

"=================" println

man trace := method(call sender)
man fuck := method(man trace)
man fuck
