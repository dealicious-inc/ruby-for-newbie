# frozen_string_literal: true

require 'rspec'

# 코드 시작
# test_1 = 2**3 != 3**2 && true
# test_2 = false || -10 < -9
# 코드 끝

RSpec.describe 'LessThanOrGreateThan' do
  it '위의 코드에 있는 __ 항목에 "||" 또는 "&&" 값을 적절하게 넣어 모든 값이 true 가 되도록 하세요' do
    expect(test_1).to eq(true)
    expect(test_2).to eq(true)
  end
end
