# 데이터 타입: Integer, Boolean, Strings, Hashes, Arrays, Symbols

## [Integer](https://ruby-doc.org/core-2.6/Integer.html)

일반적으로 숫자는 점을 소수점으로 사용하는 일련의 숫자로 정의됩니다. Ruby는 정수 및 부동 소수점과 같은 다양한 종류의 숫자를 처리할 수 있습니다.
`Ruby 2.4` 까지는 크기에 따라 두 가지 유형의 정수가 있었습니다. 하나는 `Bignum`이고 두 번째는 `Fixnum` 입니다.
`Ruby 2.4` 에서는 `Integer` 라는 abstract class 가 존재했고, `Bignum` 과 `Fixnum` 이 `Integer` 를 상속받는 구조였습니다.

```ruby
# ruby 2.4 이전
1.class       #=> Fixnum
(2**62).class #=> Bignum
```

하지만, Ruby 2.4 로 들어서면서 부터 `Fixnum` 과 `Bignum` 은 `Integer` 로 통합되었습니다.

```ruby
# ruby 2.4 이후
1.class       #=> Integer
(2**62).class #=> Integer
```

조금 특이한 점으로는 밑줄을 구분 기호로 사용할 수 있습니다. 

```ruby
price = 100_000_000
puts price      #=> 100000000
price.class     #=> Integer
```

## Boolean

`Boolean` 은 다른 언어들과 특별한 차이가 없습니다. 다만, `true`, `false` 역시 모두 `object` 라는 점입니다.
또한, `nil` 과 `0` 에 대한 처리가 `java` 나 `C` 에서의 그것과 다소 다르다는 점을 인식해야 합니다.

```ruby
if true
  puts "It is True!"
else
  puts "It is False!"
end
  
if nil
  puts "nil is True!"
else
  puts "nil is False!"
end
  
if 0
  puts "0 is True!"
else
  puts "0 is False!"
end
```

**Output:**
```shell
It is True!
nil is False!
0 is True!
```

## [String](https://ruby-doc.org/core-2.6/String.html)

`String` 역시 다른 언어들과 특별한 차이가 없습니다. `Ruby` 에서는 String 을 처리할 때 `Single Quotes` 또는 `Double Quotes` 모두를 허용합니다.
다만, `Single` 과 `Double` 간의 약간의 차이가 있는데, 다음과 같습니다.

1. Single 에서는 `Interpolation` 을 사용할 수 없다.
2. Double 은 개행처리(backslash notation) 이 허용되지만 Single 은 그렇지 않다.

```ruby
name = 'dante'

puts "my name is #{name}"   #=> my name is dante
puts 'my name is #{name}'   #=> my name is #{name}

puts 'escape using "\\"'    #=> escape using "\"
puts 'That\'s right'        #=> That's right
```

## Hashes

`Hash` 는 `key` 와 `value` 의 조합을 가지는 데이터 구조입니다. python, php 또는 node.js 등 다른 고급 언어들에서도 존재하는 개념입니다.
`Hash` 에서 `key` 와 `value` 를 연결할 때는 `=>` 글자를 이용하여 연결할 수 있습니다.
`Hash` 그 구조의 특징 상 `http request` 에 대한 값들을 저장하거나 `http response` 등의 값들을 저장하는 용도로 많이 사용되니 형태를 꼭 알아두어야 합니다.

```ruby
colors = { "red" => 0xf00, "green" => 0x0f0, "blue" => 0x00f }

puts colors["red"]      #=> 0xf00
puts colors["green"]    #=> 0x0f0
puts colors["blue"]     #=> 0x00f

colors.each do |key, value|
  puts "#{key} is #{value}"
end
```

**Output:**
```shell
red is 3840
green is 240
blue is 15
```

위의 방법 외에도 다음과 같이 `Symbol` 을 이용하여 `Hash` 를 구성할 수 있습니다. `Ruby on Rails` 개발을 시작할 경우 `Symbol` 을 이용한 `Hash` 테이블 구성을 더 많이 보게 될 것입니다. 

```ruby
colors = { red: 0xf00, green: 0x0f0, blue: 0x00f }

puts colors[:red]      #=> 0xf00
puts colors[:green]    #=> 0x0f0
puts colors[:blue]     #=> 0x00f

colors.each do |key, value|
  puts "#{key} is #{value}"
end
```

## [Array](https://ruby-doc.org/core-2.6/Array.html)

`array` 는 테이터를 저장하고 있는 리스트 요소입니다. 모든 데이터 타입에 대한 저장이 가능하며, 동일하지 않은 타입의 값 역시 동일한 배열에 저장이 가능합니다.
배열 내 각 요소들에 대해서는 콤마(,) 로 구분하며, 배열의 첫번째 시작 index 는 `0` 부터 시작합니다.

```ruby
ary = [ "fred", 10, 3.14, "This is a string", "last element", ]
ary.each do |i|
 puts i
end
```

**Output:**
```shell
fred
10
3.14
This is a string
last element
```

배열을 순차적으로 `iteration` 할 때 사용하고자 할 때에는 `each` 구문을 이용할 수 있습니다.

## [Symbol](https://ruby-doc.org/core-2.6/Symbol.html)

`Symbol` 은 `Ruby` 에서 제공되는 조금 특별한 `identity` 입니다. `Symbol` 은 colon(:) 과 함께 사용되며, `string` 에 비해서 메모리 사용량이나 실행속도 면에서 더 낫기 때문에 `string` 을 대신하여 사용하는 경우도 있습니다. 그렇다고, `symbol` 이 `string` 의 일종이라고 생각하면 안됩니다.

```ruby
:dante.object_id == :dante.object_id
#=> true

'dante'.object_id == 'dante'.object_id
#=> false
```

위의 예에서 보듯 `symbol` 이라는 것은 `어떤 값` 에 초점을 맞추는 것이 아니라 `대상` 에 초점을 맞추고 있습니다. `symbol` 의 경우 한 번 정의가 되면 같은 문자열을 사용하는 모든 심볼은 메모리 안의 같은 객체를 참조합니다. 즉, 두 `symbol` 이 같은 문자를 가지고 있다면 `object_id` 는 동일합니다.

반면, 문자열의 경우 같은 `"dante"` 라는 문자열을 가지고 있다고 하더라도, `object_id` 는 동일하지 않다는 것을 확인할 수 있습니다. 즉, 이 말은 문자열이 정의될 때마다 새로운 객체가 메모리 안에 생성된다는 것을 알 수 있습니다.

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


