# frozen_string_literal: true

require 'rspec'

=begin
  # syntax
  while [condition]
    # 실행할 코드
  end

  while 구문은 주어진 조건이 거짓이 아니라면 코드를 반복하는 순환문입니다.
  순환문 중에 03_loop 를 빠져나가고 싶다면 break 구문을 사용할 수 있습니다.
=end

def while_loop
  # 코드 시작
  number = 0
  while number < 5
    puts number
    number += 1
  end
  # 코드 끝
end

def break_while
  # 코드 시작
  number = 0
  while number < 5
    break if number == 2

    puts number
    number += 1
  end
  # 코드 끝
end

RSpec.describe 'While Loop' do
  it 'number = 0 의 초기값을 가질 때 while 03_loop 를 이용하여 "number < 5" 동안 number 값 1씩 증가하여 출력하는 03_loop 를 작성하세요' do
    msg = <<~PUBLISHED
      0
      1
      2
      3
      4
    PUBLISHED
    expect { while_loop }.to output(msg).to_stdout
  end

  it '위 구문과 동일하면서 number 값이 2일 경우 while 문을 중지하는 구문을 작성하세요' do
    msg = <<~PUBLISHED
      0
      1
    PUBLISHED
    expect { break_while }.to output(msg).to_stdout
  end
end
