def whileLoop {
 println("while loop")
 var i = 1
 while(i<=3){
  println("i love you ")
  i += 1
 }
}
whileLoop
def forLoop {
 println("for loop")
 for(i <- 0 until 2){
  println("i miss you")
 }
}
forLoop
def rubyStyleForLoop {
 println("ruby for loop")
 Array("i","love","you").foreach{ it =>
  println(it)
 }
}
rubyStyleForLoop
