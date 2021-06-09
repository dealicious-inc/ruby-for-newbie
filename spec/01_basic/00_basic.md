# 다른 언어와 구분되는 Ruby 특징

## Iteration

`ruby` 에서는 다양한 방법으로 `iteration` 을 제공하고 있고, 그 형태도 타 언어와는 좀 낯선 모습을 보이고 있습니다. `ruby` 뿐만 아니라 `ruby on rails` 에서도 `iteration` 은 상당히 많이 사용되는 구문이기 때문에 그 형태에 익숙해져야 할 필요가 있습니다.

`C++` 또는 `Java` 에서처럼 `for (초기값; 조건; 증가값)` 형태의 구문에 익숙하거나, `python` 에서처럼 `for i in aList: ...` 형태에 익숙한 경우에는 `ruby` 의 `iteration` 이 익숙하지 않을 수 있습니다.

`ruby` 에서 권장하는 `iteration` 은 다음과 같은 코드 양식을 가집니다.

```ruby
some_list.each do |item|
  # 블록 내부
  # item 은 some_list 내의 한 요소
end
```

`each` 뿐 아니라 `collect`, `find`, `inject`, `map`, `reject`, `select` 등 많은 경우에서 위와 같은 형태로 `iteration` 을 수행합니다.

## Symbol 은 문자열이 아닙니다.

일부 document 들에서 `symbol` 을 가벼운 문자열에 비교하고 있습니다. 이는 `symbol` 이 가지는 하나의 특징일 뿐이지 전체를 의미하는 바로는 틀린 말입니다.

`symbol` 을 한마디로 정의하면 `identity` 라고 정의하는 것이 맞을 것 같습니다.

아래의 예시를 살펴보겠습니다.

```ruby
:dante.object_id == :dante.object_id
#=> true

"dante".object_id == "dante".object_id
#=> false
```

위의 예시에서 보듯이 같은 이름을 가진 `symbol` 은 동일한 메모리 주소를 반환하는 것을 볼 수 있습니다. 반면, 같은 문자열을 만든다 해도 그 메모리 주소는 다른 형태를 가지고 있습니다.
즉, `symbol` 의 경우 한번 사용하면 같은 이름의 `symbol` 은 동인한 메모리 객체를 참조하고 그 메모리 번지를 반환하는 형태이지만, `string` 의 경우 정의될 때마다 새로운 메모리를 할당하고 할당된 메모리 번지를 반환하게 됩니다.

`symbol` 과 `string` 간의 미묘한 차이를 이해하고 있어야 합니다. `symbol` 을 사용할지 `string` 을 사용할지 결정해야 한다면, 무엇에 초점을 맞추고 있는지를 생각해보세요. 객체의 `identity` 가 중요하다면 (ex, 해시 키) `symbol` 이 적당하고, 내용이 중요하다면 `string` 을 사용하세요.

```ruby
# string 을 이용한 hash 구성
colors = { "red" => 0xf00, "green" => 0x0f0, "blue" => 0x00f }

puts colors["red"]      #=> 0xf00
puts colors["green"]    #=> 0x0f0
puts colors["blue"]     #=> 0x00f

# symbol 을 이용한 hash 구성
colors = { red: 0xf00, green: 0x0f0, blue: 0x00f }

puts colors[:red]      #=> 0xf00
puts colors[:green]    #=> 0x0f0
puts colors[:blue]     #=> 0x00f
```

위의 경우 외에도 상당히 많은 케이스에서 `symbol` 은 광범위하게 사용되고 있습니다. `Symbol` 에 대한 다양한 사용법은 추후 `Ruby on Rails` 교육에서 다시 진행할 예정입니다.

## 모든 것은 Object 입니다.

`ruby` 에서는 모든 것이 객체입니다. 심지어 `0`, `nil` 과 같은 값과 클래스 조차도 객체로 취급됩니다.

```ruby
0.class
#=> Integer

nil.class
#=> NilClass

MyClass = Class.new do
  attr_accessor :instance_var
end
# 위 클래스 구문은 다음과 동일합니다.
class MyClass
  attr_accessor :instance_var
end
```

위의 예제와 같이 `ruby` 내에서 동작하는 모든 것은 객체로 취급되고 있음은 아주 중요합니다.

## 규칙

`ruby` 내에서는 몇몇 규칙을 강제합니다. 

1. 대문자로 시작하는 식별자는 상수입니다.
2. `$` 기호로 시작하면 전역변수 입니다. (안티패턴입니다)
3. `@` 기호로 시작하면 인스턴스 변수입니다.
4. `@@` 기호로 시작하면 클래스 변수입니다.
5. 메소드 이름은 `소문자` 로 시작하며 `snake_case` 로 생성합니다.
6. 클래스 이름은 `대문자` 로 시작하며 `CamelCase` 로 생성합니다.

## 메소드 인자

`ruby` 에서는 다음의 예제처럼 `argument` 에 특별한 인자를 지정하지 않습니다.

```ruby
def deliver(from, to, via)
  "send from #{from} to #{to} via #{via}"
end
# deliver('dante', 'shim', 'email')
#=> send from dante to shim via email
# deliver('dante')
# ArgumentError (wrong number of arguments (given 1, expected 3))
```

`ruby 2.0` 부터 새롭게 추가된 기능 중 메소드 인자에 키워드를 지정할 수 있습니다. 새롭게 추가된 메소드 인자를 통해 좀 더 명확하게 메소드 인자를 정의할 수 있습니다.
또한, 메소드 인자에 원하는 값이 들어오지 않았을 경우 조금 더 명확한 오류를 확인할 수 있습니다.

```ruby
def deliver(from:, to:, via:)
  "send from #{from} to #{to} via #{via}"
end
# deliver(from: 'dante', to: 'shim', via: 'email')
#=> send from dante to shim via email
# deliver(from: 'dante')
# ArgumentError (missing keywords: to, via)
```

## 범용적인 참

`ruby` 에서는 `nil` 과 `false` 를 제외한 모든 것이 참입니다. 타 언어에서처럼 `0` 이 `false` 로 취급되지 않습니다.

예를들어, 다음과 같이 python 구문을 작성했다고 생각해 보겠습니다.

```python
if 0:
  print("0 is true")
else:
  print("0 is false")
```

위 구문은 "0 is false" 를 출력합니다. 같은 구문이지만 `ruby` 에서는

```ruby
if 0
  puts "0 is true"
else
  puts "0 is false"
end
```

"0 is true" 를 출력합니다.

## 열린 클래스

`ruby` 에서 기본으로 제공되는 많은 클래스에 대해 확장하는 것이 가능합니다. 예를 들어, `Integer` 라는 클래스에 대해 `hours` 라는 method 를 추가하고자 한다면 다음과 같이 가능합니다.

```ruby
class Integer
  def hours
    self * 3600
  end
  
  alias hour hours
end

# 14.hours
#=> 50400
```

## 특이한 메소드 이름

`ruby` 에서는 method 이름이 `물음표` 나 `느낌표` 로 끝날 수 있습니다. 관례적으로 `boolean` 값을 반환하는 질문형태의 method 는 이름에 `?` 를 붙입니다.

또한, 예외가 발생되는 상황이나 자신(self)를 변경시키는 상황에서는 `!` 를 사용하는 것을 권장합니다.

```ruby
@array = [1, 2, 3]

def empty?
  @array.length == 0
end

def find_value(value)
  @array.index(value)
end

def find_value!(value)
  index = find_value(value)
  fail "value #{value} not found" unless index
  
  index
end
```

## 없는 메소드

`ruby` 에서는 특정 method 를 찾을 수 없어 응답을 할 수 없을 때 바로 실패를 리턴하는 것이 아니라 `method_missing` 이라는 method 를 호출합니다. 기본적으로 `method_missing` 은 `NameError` 예외를 발생시키지만, 사용자가 적절하게 재 구성하여 사용할 수 있습니다.

```ruby
# very_strange_method("string")
#=> NoMethodError (undefined method `very_strange_method' for main:Object)

def method_missing(id, *arguments)
  puts "Method #{id} was called, but not found, it has arguments: #{arguments.join(',')}"
end
# very_strange_method("string")
#=> Method very_strange_method was called, but not found, it has arguments: aa
```

## 메서드 호출의 진실

`method` 호출은 다른 객체로 던지는 `메시지` 입니다. 이것이 어떤 의미를 표현하는지 아래의 예시를 보겠습니다.

```ruby
1 + 2
#=> 3

1.+(2)
#=> 3

1.send :+,  2
#=> 3
```

위의 3가지 방법은 사실 모두 동일한 방법입니다. 또 다른 예를 하나 보겠습니다.

```ruby
@array = [1, 2, 3]

def find_value(value)
  @array.index(value)
end

# find_value(1)
#=> 0

# send :find_value, 1
#=> 0
```
