# frozen_string_literal: true

require 'rspec'

# !Proc 는 향후 재활용 가능한 block 코드를 작성하는 것이 목적입니다.

# 코드 시작
cube = Proc.new { |x| x * 2 }
# 코드 끝
numbers = (1..10).to_a
numbers.collect!(&cube)

floats = [1.2, 3.45, 0.91, 7.727, 11.42, 482.911]
# 코드 시작
round_down = Proc.new { |num| num.floor }
# 코드 끝

RSpec.describe 'Proc' do
  it '1에서 10까지의 값을 갖는 numbers range 배열이 있을 때, 해당 배열 내의 값을 두 배로 만드는 코드를 Proc 를 이용해 작성하세요.' do
    expect(numbers).to eq((1..10).map(&cube))
  end

  it '".floor" 라는 method 는 소수점 뒤를 날려버리고, 정수형을 만드는 method 입니다. floats 라는 실수형 값들의 배열 내에 있는 값들을 .floor 를 이용해 정수로 만들고자 합니다. \
        재사용 가능한 Proc 를 "round_down" 이라는 이름으로 만드세요.' do
    expect(floats.collect(&round_down)).to eq(floats.collect { |num| num.floor })
  end
end
