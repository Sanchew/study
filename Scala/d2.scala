class Compass {
 val directions = List("north", "east", "south", "west")
 var bearing = 0
 print("Initial bearing: ")
 println(direction)
 
 def direction() = directions(bearing)
 
 def inform(turnDirection: String) {
  println("Turning " + turnDirection + ". Now bearing " + direction)
 }

 def turnRight() {
  bearing = (bearing + 1) % directions.size
  inform("right")
 }

 def turnLeft() {
  bearing = (bearing + (directions.size - 1)) % directions.size
  inform("left")
 }
}
val mc = new Compass
mc.turnRight
mc.turnRight
mc.turnLeft
mc.turnLeft
mc.turnLeft

class Person(val name:String) {
 println("Outer constructor")
 def this(first_name:String, last_name:String) {
  this(last_name)
  println("Inner constructor")
 }
 def talk() = println("Hi")
 def talk(message: String) = println(name + " says " + message)
 def id(): String = name
}

object Person {
 def rule = println("To rule them all")
}

Person.rule

val bob = new Person("Bob")
val bobTate = new Person("Bob","Tate")

class Employee(override val name: String, val number: Int) extends Person(name){
 override def talk(message: String) {
  println(name + " with number " + number + " says " + message)
 }
 override def id():String = number.toString
}

val employee = new Employee("Yoda", 4)
employee.talk("Extend or extend not. There is not try.")

trait Nice {
 def greet() = println("Howdily doodily.")
}

class Character(override val name: String) extends Person(name) with Nice

val flanders = new Character("Ned")
flanders.greet
