# frozen_string_literal: true

require 'rspec'

=begin
  until [condition]
    # 실행할 코드
  end

  until 구문은 주어진 조건이 참이 되기 전까지 반복하는 순환문입니다. (즉, 조건이 거짓이어야 합니다)
  until 구문은 기본적으로 while 구문과 반대되는 개념으로 조건을 비교합니다.
  순환문 중에 03_loop 를 빠져나가고 싶다면 break 구문을 사용할 수 있습니다.
=end

def until_loop
  # 코드시작
  counter = 1
  until counter >= 10
    puts counter
    counter += 1
  end
  puts counter
  # 코드 끝
end

def break_loop
  # 코드시작
  counter = 1
  until counter >= 10
    break if counter == 5

    puts counter
    counter += 1
  end
  puts counter
  # 코드 끝
end

RSpec.describe 'Until Loop' do
  it 'counter = 1 의 초기값을 가질 때 until 03_loop 와 puts 를 이용하여 1 에서 10 까지 출력되는 03_loop 를 작성하세요' do
    msg = <<~MSG
      1
      2
      3
      4
      5
      6
      7
      8
      9
      10
    MSG
    expect { until_loop }.to output(msg).to_stdout
  end

  it '위의 구문과 동일하지만 counter 가 5일 경우 03_loop 를 빠져나오는 구문을 작성하세요' do
    msg = <<~PUBLISHED
      1
      2
      3
      4
      5
    PUBLISHED
    expect { break_loop }.to output(msg).to_stdout
  end
end
