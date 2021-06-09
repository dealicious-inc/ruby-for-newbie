require 'rspec'

=begin
  # syntax
  if [condition]
    # 실행할 코드
  end

  주어진 condition 이 참일 경우에 실행하는 구문입니다.

  [rails_way]
  1. 한줄에 사용할 수 있는 조건문을 더 선호합니다.
    ex) puts 'ruby way' if [condition]
    ex) puts 'ruby way' unless [condition]
  2. if 대신 삼항 연산자를 사용할 수 있는 경우라면 삼항 연산자를 사용합니다.
    ex) puts 3 < 4 ? '3은 4보다 작습니다' : '3은 4보다 작지 않습니다'
    !!) 3항 연산자가 가독성 면에서 더 좋은 것인가는 question 입니다. 저는 개인적으로 3항 연산자 보다는 if / else 가 더 나은 것 같습니다.
=end

# 코드시작

def condition(number)
  return 'pick negative integer' if number < 0
  return 'pick positive integer' if number > 0

  'pick zero'
end

def check(number)
  return true unless number == 0 # unless 구문을 함께 사용해 보자

  false
end
# 코드 끝


RSpec.describe 'Condition' do
  it '0이 입력값으로 넘어가면 true, 그렇지 않으면 false 를 반환하는 check 함수를 만들어 보세요' do
    expect(check(0)).to eq(true)
    expect(check(1)).to eq(false)
    expect(check(-1)).to eq(false)
  end

  it '0을 입력하면 "pick zero", 0 보다 큰 값을 입력하면 "pick positive integer", 0 보다 작은 값을 입력하면 "pick negative integer" 를 출력하는 조건함수를 만들어 보세요.' do
    expect(condition(0)).to eq('pick zero')
    expect(condition(3)).to eq('pick positive integer')
    expect(condition(-2)).to eq('pick negative integer')
  end
end
