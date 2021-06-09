# frozen_string_literal: true

require 'rspec'

=begin
  # syntax
  for variable_name[, variable...] in expression [do]
    # 실행할 코드
  end

  for 문은 range 객체의 값을 하나씩 꺼내 variable 에 할당하는 방법으로 반복합니다.
=end

def for_loop
  # 코드 시작
  for n in 1..10
    puts n
  end
  # 코드 끝
end

def even_loop
  for n in 1..10
    next if n % 2 != 0
    puts n
  end
end

RSpec.describe 'For Loop' do
  it 'range 1에서 10 사이의 값을 puts 로 출력하는 구문을 작성하세요.' do
    msg = <<~PUBLISHED
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
    PUBLISHED

    expect { for_loop }.to output(msg).to_stdout
  end

  it '1에서 10 사이의 값중 짝수를 출력하는 구문을 작성하세요.' do
    msg = <<~PUBLISHED
      2
      4
      6
      8
      10
    PUBLISHED

    expect { even_loop }.to output(msg).to_stdout
  end
end
