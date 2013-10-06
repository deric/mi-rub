class Person
  
  def initialize(name, age)
    @name, @age = name, age
  end
  def name
    @name  
  end
  def name=(name)
    @name=name
  end

  def age=(age)
    @age = age
  end
  
  def same_age_as(person)
    if age == person.age
      return true
    end
    false
  end
  
private

  def age
    @age
  end
end

p1 = Person.new("Mike", 15)
p2 = Person.new("Paul", 20)
puts p1.same_age_as(p2)

p.name = "Mike"
p.age = 18
puts p.to_s
puts "name: #{p.name}, age: #{p.age}"

