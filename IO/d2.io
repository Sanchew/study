#!/usr/local/bin/io
Object reflect := method(
 prototype := self proto
 if (prototype != Object,
  writeln("Slots of ",prototype type,"\n--------------")
  prototype slotNames foreach(slotName, writeln(slotName))
  writeln
  prototype reflect))

Animal := Object clone
Animal eat := method("eat anything" println)

Person := Animal clone
Person speak := method("i say the hello" println)

Woman := Person clone
Woman bear := method("bear Person" println)

Man := Woman clone
Man bear := method(nil println)

lee := Man clone
jiaojiao := Woman clone
lee bear
jiaojiao bear


Man reflect

"=============" println

fib := method(i,
 if(i<1,"Please input more than the 1" println,
  b := 0
  a := 1
  for(j,1,i,
   a println
   a = a + b
   b = a - b
  )
 )
)

fib(4)

"===============" println
fibx := method(t,i,a,b,
 if(t<1,"Please input more than the 1" println;return)
 if(i==nil,i=1;a=1;b=0)
 if(i>t,return)
 a println
 a = a + b
 b = a - b
 fibx(t,i+1,a,b)
)
fibx(3)

"==================" println

OperatorTable addOperator("xor",11)

Number over := Number getSlot("/")
Number / := method(b,if(b==0,0,call target over(b)))

(1 / 3) println
(2 / 0) println

"================" println

NotNumberException := Error clone
List myAvg := method(
 sum := 0
 call target foreach(i,if(i proto == Number,sum = sum + i,Exception raise("the list have not a number object")))
 (sum / (call target size))
)

arr := list(1,2,3)
arr myAvg println
arr = list(1,"2",3)
e := try(
 arr myAvg println
)

e catch(Exception,
 e coroutine backTraceString println
)

"================" println
Dim := List clone

dim := method(x,y,
 arr := Dim();
 for(i,1,y,
  sub := list();
  for(j,1,x,sub append(nil));
  arr append(sub)
 );
 arr
)
 
Dim set := method(x,y,v,call target at(y) atPut(x,v))

Dim get := method(x,y,call target at(y) at(x))

d2 := dim(3,3)
for(i,0,2,for(j,0,2,d2 set(i,j,i + j)))
d2 println
writeln("[1,2]",(d2 get(1,2)))
d2 set(1,2,9)
writeln("[1,2]",d2 get(1,2))
writeln(d2)
"----------------" println

Dim matrix := method(
 self := call target
 arr := self clone
 arr foreach(y,i,arr atPut(y,i clone))
 self foreach(y,i, i foreach(x,n, arr set(y,x,n)))
 arr
)

d2 println
"------" println
d3 := d2 matrix

d2 println
"------" println
d3 println
"=======================" println
d3

f := File with("2d.txt")
f remove
f openForUpdating
f write(d3 asString)
f close

dd := doFile("2d.txt")
dd println

"========================" println

num := Random value(0,100) floor
i := 0
while(i < 9,
 "请输入:" println;
 n := File standardInput readLine asNumber
 if(n < num) then("猜小了" println) elseif(n > num) then("猜大了" println) else("猜对了" println;i = -1;break);
 i = i + 1
)
if(i != -1,"lost")


