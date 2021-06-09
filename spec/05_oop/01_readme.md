# Object-Oriented Programming I

## class

`ruby` 에서 클래스는 다른 언어들에서처럼 `class` 를 이용하여 표현합니다.

```ruby
class Person
  ...
end
```

생성자(초기화) 함수는 `initialize` 이며, 이는 `.new` method 가 사용되면 호출됩니다.

```ruby
class Person
  def initialize
    # 초기화 코드
  end
  
  ...
end
```

`ruby` 에서 `class intance` 는 `.new` method 가 호출됨으로서 생성이 됩니다. `.new` method 는 argument 를 전달할 수 있습니다.

```ruby
class Person
  def initialize(name, age)
    @name = name
    @age = age
  end
  
  ...
end

# dante = Person.new('dante', 48)
```

## Inherit Class

`ruby` 에서 클래스의 상속은 `<` 기호를 사용합니다.

```ruby
class Trip
  def initialize(duration, price)
    @duration = duration
    @price = price
  end
end

class Cruise < Trip
  def initialize(duration, price)
    super
  end
end

backpacking = Trip.new(14, 800_000)
vacation = Cruise.new(7, 2_300_000)
```

> ruby 에서는 다중 상속을 지원하지 않습니다.

## Instance Variable

`ruby`에서 `@` 기호는 인스턴스 변수를 나타내는 데 사용됩니다. 인스턴스 변수는 클래스 자체의 모든 멤버가 아닌 해당 클래스의 각 인스턴스에 특정한 값을 보유합니다.

```ruby
class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end
end
```

## Class Variable

`ruby` 에서 `@@` 기호는 클래스 변수를 나타내는 데 사용됩니다. 인스턴스가 아닌 클래스 레벨에서 관리되는 변수입니다.

```ruby
class Student
  @@users = {}
  
  def initialize(name, grade)
    @name = name
    @grade = grade
    @@users[name] = grade
  end
  
  def self.grade(name)
    @@users[name]
  end
end
```

## Getter / Setter

보통의 일반 `oop language` 의 경우 클래스를 구현할 때 `getter` 와 `setter` 를 고려하여 코드를 작성하곤 합니다. `ruby` 에서는 `getter` 와 `setter` 를 어떻게 구현할 수 있을까요?

일반적으로 다음과 같이 작성이 가능합니다.

```ruby
class Student
  def initialize(name)
    @name = name
  end
  
  # Getter
  def name
    @name
  end
  
  # Setter
  def name=(value)
    @name = value
  end
end
```

위의 방식 말고 더 나은 방법이 없을까요? `ruby` 에서는 다음과 같은 구성을 제공합니다.

`ruby` 에서는 `attr_reader` 와 `attr_writer` 그리고 이 둘을 혼합한 `attr_accessor` 를 이용할 수 있습니다.

```ruby
class Student
  attr_reader :name
  attr_writer :name
  # attr_accessor 로 한번에 해결할 수 있습니다.

  def initialize(name)
    @name = name
  end
  
  top_student = Student.new('dante')
  puts top_student.name     #=> dante
  
  top_student.name = 'astroshim'
  puts top_student.name     #=> astroshim
end
```

