# BLOCKS, PROCS, AND LAMBDAS

## Block

루비에서 `block` 이라는 것은 method 에 전달할 수 있는 일정의 `anonymous` 함수라고 할 수 있습니다.
`block` 은 `do / end` 구문으로 감싸질 수 있으며, 단순하게 `{}` 를 이용할 수 있습니다.

우리는 이미 예전에 `.each` 구문을 사용했습니다. `.each` 구문은 그 자체로 `block` 이기 때문에 우리는 이미 ruby 의 `block` 구문을 이용했다고 볼 수 있습니다.

아래의 예제를 살펴보겠습니다.

```ruby
(1..10).each { |num| puts num }
```

단순하게 1에서 10까지의 숫자를 출력하는 구문입니다. 여기에서 `{` 와 `}` 사이에 들어가는 구문이 `block` 입니다.
또 다른 예시를 하나 보겠습니다.

```ruby
(1..10).each do |num|
  puts num
end
```

위의 예제에서 `do` 와 `end` 가 이전의 예시에서 `{` 와 `}` 의 사용법과 동일하다고 할 수 있습니다.
다만, `ruby` 에서는 한 줄의 간단한 `block` 을 이용할 때는 `{ }` 로 감싸는 것을 권장하며, `multi line block` 을 이용할 경우에는 `do / end` 를 이용할 것을 권장합니다.

`ruby` 의 `block` 을 이해하려면 먼저 `yield` 를 이해해야 합니다. `yield` 는 `ruby keyword` 이며 `block` 을 호출하고자 할 때 사용됩니다. 어떤 의미인지 텍스트 상으로는 이해가 잘 안될 수 있으니 예제를 통해 확인해 보도록 하겠습니다.

우선, `yield` 의 간단한 예시를 살펴보도록 하겠습니다.

```ruby
def print_once
  yield
end

print_once { puts "Block is here" }

# Block is here
```
위의 예시에서 `{ puts "Block is here }` 이 `block` 입니다. 다른 곳 (함수와 같은 곳) 에서 `block` 을 호출하려면 `yield` 를 호출하면 됩니다.

`yield` 는 여러번 호출이 가능합니다.

```ruby
def print_twice
  yield
  yield
end

print_twice { puts "Block is here" }

# Block is here
# Block is here
```

`yield` 를 호출 할 때 `argument` 를 `block` 으로 전달할 수도 있습니다. 전달된 `argument` 는 `block` 내에서 인자로 받아 사용할 수 있습니다. 사용법을 유심히 봐주세요.

```ruby
def one_two_three
  yield 1
  yield 2
  yield 3
end

one_two_three { |number| puts number * 10 }

# 10, 20, 30
```

`block` 은 `명시적` 사용법과 `암시적` 사용법이 존재합니다. 아래의 예를 통해 살펴보겠습니다.

```ruby
def explicit_block(&block)
  block.call # same as yield
end

explicit_block { puts "Explicit block called" }
```

위의 예제는 `block` 을 `명시적` 으로 사용하는 예시입니다. 하지만, 일반적으로 `ruby` 진영 또는 `rails` 코드 내에서 `block` 은 `암시적` 으로 많이 사용되며, 그 사용법은 다음과 같습니다.

만약, `block` 을 호출하기 위해 `yield` 를 호출하였는데 `block` 이 정의되어 있지 않다면 `ruby` 에서는 `no block given (yield)` 라는 `error` 를 반환하게 됩니다.

우리는 `yield` 를 호출하기 전에 `block` 을 호출할 수 있는 상태인지를 먼저 확인할 필요가 있습니다. 아래의 예시에서는 `block_given?` 이라는 사전 정의된 `method` 를 이용하여 안전한 `block` 호출이 가능할 수 있도록 하는 예제입니다.

```ruby
def do_something_with_block
  return "No block given" unless block_given?
  yield
end
```

`block` 은 `rails` 에서 아주 광범위하게 사용됩니다. 특히, `config` 설정을 할 때 아주 편리하게 사용될 수 있습니다.

`abara` 또는 `dealibird` 의 `config/initializers` 폴더 내에 존재하는 각종 `config` 파일들을 참조하세요.

또한, 아래와 같이 어떤 작업을 진행하기 전 사용자가 작성한 `block` 구문을 통해 가변적인 처리방식이 필요할 때도 유용하게 사용될 수 있습니다.

```ruby
ssm_app_install_permission_by_device = SsmAppInstallPermissionByDevice.create_or_find_by(UUID: device_params[:UUID]) do |new_record|
  new_record.assign_attributes(device_params)
end
```

## Proc

루비에서는 Proc 클래스를 통해서 익명 함수를 생성할 수 있습니다. 여기서 Proc은 Procedure의 줄임말로 어떤 처리 과정(절차)을 담고있다는 의미입니다. Proc 또한 일반적인 루비 클래스와 다르지 않으므로 Prow.new 메서드로 객체를 생성할 수 있습니다.

```ruby
Proc.new do
  puts 'Hello, World!'
end

# => #<Proc:0x007f99f12c6bf8@(pry):2>
```

Proc.new는 Proc 객체를 반환합니다. 이 생성자 메서드는 넘겨받은 익명 함수에 대해서 어떠한 일도 하지않고, 익명 함수를 그대로 저장해둡니다. 앞서 이야기했듯이 블록에 쓰여진 루비 표현식은 곧바로 실행되지 않습니다. 따라서 puts 'Hello, world!'가 출력되지는 않습니다.

이 Proc 객체는 원하는 시점에 실행할 수 있습니다. 다음 예제에서는 이 Proc 객체를 변수에 대입하고 실행하는 방법을 살펴보겠습니다. Proc 객체를 실행하는 방법은 크게 3가지가 있습니다. 첫번째는 .call() 메서드를 사용한 호출법입니다. 제일 명시적인 표현법입니다. 이외에도 .()과 []와 같은 조금은 낯설게 보이는 방법도 있습니다. 우리는 다른방법은 사용하지 않고 명확하게 확인할 수 있는 `.call()` 함수를 사용하는 방법을 이용하도록 하겠습니다.

.call() 메서드를 사용한 호출법과 작동 방식은 같습니다.

```ruby
# 여기서는 편의상 do...end 대신 { }을 사용했습니다. 의미는 같습니다.
p = Proc.new { puts 'Hello, world!'}

p.call()
# Hello, world!
```

파이썬이나 자바스크립트 같은 언어를 사용해왔다면 이런 표현이 거슬릴 지도 모릅니다. 자바스크립트에서는 익명 함수와 기명 함수의 실질적인 차이가 없습니다. 따라서 자바스크립트에서는 아래의 두 방법으로 함수를 선언한 결과가 실질적으로 같습니다.

```javascript
// 일반적인 함수 선언
function hello1() { console.log('Hello, world!') }

// 익명 함수를 사용한 함수 선언
var hello2 = function() { console.log('Hello, world!') }
```

익명 `명시적` 함수이거나 `익명` 함수이거나 정의하는 방법은 조금 달라도 사용하는 방법과 호출하는 방법은 동일합니다.

위의 자바스크립트 함수를 호출하는 방법은 다음과 같습니다.

```javascript
hello1()
// Hello, World!

hello2()
// Hello, World!
```

루비에서는 다릅니다. 위의 루비 예제에서는 익명 함수(Proc 객체)를 p 변수에 대입했습니다만, 함수처럼 직접 호출하는 것은 불가능합니다.

```ruby
p = Proc.new { puts 'Hello, World!' }

p()

# nil
# NoMethodError: undefined method `a' for main:Object
```

## Lambda

흥미롭게도(그리고 혼란스럽게도) 루비에는 lambda라는 Proc 객체를 생성하는 또 다른 방법이 존재합니다. 먼저 lambda 문을 사용해 Proc 객체를 만들어보겠습니다.

```ruby
l = lambda{ puts 'Hello, world!' }

l.class
# Proc

l.call()
# Hello, world!
```

`Ruby 1.9` 부터는 `lambda` 대신 신택스 슈가인 `->` 를 이용할 수도 있습니다.

```ruby
-> { puts 'Hello, world!' }
```

그렇다면 왜 lambda 문은 왜 존재하는 걸까요? 루비에서는 lambda 문으로 생성된 객체가 일반적인 Proc 객체보다 좀 더 함수답게 작동한다는 차이점을 가지고 있습니다.

### 인자 검사 방식의 차이

첫 번째 차이점은 lambda로 만들어진 Proc 객체는 인자 개수를 엄격하게 검사합니다. 일반적으로 블록에서는 블록 인자라는 독특한 방법으로 인자를 받습니다. 여기서는 하나의 인자를 받는 Proc 객체를 만들고, 인자 개수를 바꿔가며 실행해보겠습니다.

```ruby
hello = Proc.new { |name| puts 'Hello, #{name}!'}
hello.call()
# Hello, !

hello.call('Jack')
# Hello, Jack!

hello.call(1, 2, 3, 4, 5)
# Hello, 1!
```

블록에서는 하나의 인자로 정의되어있지만, 인자 개수가 달라지더라도 에러가 발생하지 않습니다. 이런 점에서 Proc 객체는 이름 그대로 절차만 저장된 객체라고 할 수 있습니다.

반면 lambda로 만든 Proc 객체는 다르게 작동합니다.

```ruby
hello = lambda(name) { puts "Hello, #{name}!" }

# 신택스 슈가를 사용할 때는 다음과 같이 정의합니다
-> (name) { puts "Hello, #{name}!"}

hello.call()
# ArgumentError: wrong number of arguments (0 for 1)

hello.call('Jack')
# hello, Jack!

hello.call(1, 2, 3, 4, 5)
# ArgumentError: wrong number of arguments (5 for 1)
```

인자를 넘기지 않거나 더 많은 인자를 넘긴 경우 ArgumentError 예외가 발생한 것을 볼 수 있습니다.

### return 작동 방식의 차이

proc과 lambda의 또 다른 차이 점은 return의 작동 방식입니다. 먼저 일반적은 Proc 객체가 동작하는 방식을 살펴보겠습니다.

```ruby
def return_two(&p)
  p.call
  return 2
end

return_two(&Proc.new { return 1 })
# LocalJumpError: unexpected return
```

밖에서 Proc 객체를 넘겨받으면 LocalJumpError 예외를 발생시킵니다. 이는 return이 어떤 맥락에서 해석되어야하는 지가 불분명하기 때문입니다

다음은 밖에서 넘겨받는 대신 안에서 Proc 객체를 생성하는 예제입니다.

```ruby
def return_two()
  p = Proc.new { return 1 }
  p.call
  return 2
end

return_two
# => 1
```

이번에는 1을 반환합니다. 놀랍게도 Proc 객체의 return 문이 return_two의 retrun으로 실행된 것을 알 수 있습니다. 이런 의도로 Proc 객체를 쓰는 일은 아마 거의 없을 듯 합니다.

그럼 이번에는 lambda로 만든 Proc 객체를 실행해보죠

```ruby
def return_two(&p)
  puts p.call
  return 2
end

return_two(&lambda{ return 1 })
# 1
# => 2
```

p.call의 반환값이 1이 되는 것을 알 수 있습니다. 이를 통해서 lambda 함수에서 return 문을 사용하면 Proc 객체, 즉 익명 함수 자체의 반환이 되는 것을 알 수 있습니다. 따라서 lambda 함수에서는 1을 반환하고, return_two 함수에서는 의도한 대로 넘겨준 lambda 객체와는 무관하게 2를 반환합니다.

> 본문의 일부 내용 (proc, lambda 의 차이점) 은 https://www.44bits.io/ko/post/ruby-proc-and-lambda 에서 참조하였습니다.



