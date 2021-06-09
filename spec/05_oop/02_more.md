# Object-Oriented Programming II

## public / private / protected

`ruby`에서는 기본적으로 메서드가 공개되므로 `public`, `private` 또는 'protected' 를 지정하지 않으면 메서드가 공개됩니다. 만약, 어떤 메서드가 퍼블릭인지 명확히하고 싶다면 다음과 같이 메서드 정의 앞에 public 을 두면됩니다.

한가지 확인하고 갈 부분은 `public`, `private`, `protected` 중 하나가 지정이 되면 이후 다시 지정하기 전까지는 계속 해당 모드가 적용이 된다는 것입니다.

```ruby
class Dog
  def initialize(name, breed)
    @name = name
    @breed = breed
  end

  public

  def public_method
  end

  # bark 도 public method 입니다
  def bark
    puts "Woof!"
  end
  
  private
  
  # 여기서 부터는 private method 로 지정이 됩니다.
  def id
    @id_number = 12345
  end
end
```

## Module

`module` 은 클래스와 유사하지만 `behavior` 에 집중하는 용도로 사용이 됩니다. `module` 은 instance 를 생성할 수 없기 때문에 `initialize` method 가 필요없습니다.

또한, `module` 은 상속개념이 존재하지 않습니다. `ruby` 에서 `module` 은 상수를 저장하거나 재활용 가능한 method 를 생성하는 용도로 사용됩니다.

```ruby
module Circle

  # ruby 에서 상수는 대문자로 표시합니다. (두개 이상의 단어가 있는 경우 밑줄로 연결됩니다.)
  PI = 3.141592653589793
  
  def self.area(radius)
    PI * radius**2
  end
  
  def self.circumference(radius)
    2 * PI * radius
  end
end

# Circle::PI        #=> 3.141592653589793
# Circle::area(3)   #=> 28.274333882308138
# Circle.area(3)    #=> 28.274333882308138
```

`module` 을 정의하는 방법을 알아봤으니, 이제 사용하는 방법도 알아볼 차례입니다. 일반적으로 module 의 어떤 값을 사용하기 위해서는 다음과 같이 사용할 수 있습니다.

```ruby
require 'date'

Date.today      #=> #<Date: 2021-06-07 ((2459373j,0s,0n),+0s,2299161j)>
Math.cos(3)     #=> -0.9899924966004454
```

클래스 내에서 `module` 을 사용하는 좀 더 복잡한 경우를 살펴보겠습니다.

```ruby
class Angle
  attr_accessor :radians
  
  def initialize(radians)
    @radians = radians
  end
  
  def cosine
    Math.cos(@radians)
  end
end

acute = Angle.new(1)
acute.cosine
```

만약, 위의 코드 중 `Math.cos` 를 이용하는 것이 번거로워서 `cos` 만으로 사용하고 싶다면 어떻게 하면 될까요? 정의된 `module` 을 다른 곳에서 이용하고자 한다면 간단하게 `include` 구문을 이용하여 포함시키면 됩니다.

```ruby
class Angle
  include Math      # Math module 을 include 합니다
  
  attr_accessor :radians
  
  def initialize(radians)
    @radians = radians
  end
  
  def cosine
    cos(@radians)   # 위에서 Math module 이 include 되었기 때문에 Math.cos 대신 cos 만 작성해도 됩니다.
  end
end

acute = Angle.new(1)
acute.cosine
```
```



