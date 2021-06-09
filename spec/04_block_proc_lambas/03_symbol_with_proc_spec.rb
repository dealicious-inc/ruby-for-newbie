# frozen_string_literal: true
require 'rspec'

strings = ["1", "2", "3"]
# 코드 시작
numbers = strings.map!(&:to_i)
# 코드 끝

numbers_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# 코드 시작
strings_array = numbers_array.collect(&:to_s)
# 코드 끝

RSpec.describe 'Symbol With Proc' do
  it '위의 strings 배열의 모든 값을 숫자로 변경하는 구문을 symbol 과 proc 를 이용하여 numbers 배열에 넣는 구문을 작성하세요.' do
    expect(numbers).to eq([1, 2, 3])
  end

  it 'numbers_array 를 모두 strings_array 로 변환하는 구문을 작성하세요' do
    expect(strings_array).to eq(numbers_array.map! { |x| x.to_s })
  end
end
