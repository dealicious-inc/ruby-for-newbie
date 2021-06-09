# frozen_string_literal: true

require 'rspec'

strings = ["leonardo", "donatello", "raphael", "michaelangelo"]

# 코드 시작
symbolize = lambda { |x| x.to_sym }
symbols = strings.collect(&symbolize)
# 코드 끝

my_array = ["rainmaker", :inception, "hulk", :avengers]
# 코드 시작
symbol_filter = lambda { |x| x.is_a? Symbol }
filtered_symbols = my_array.select(&symbol_filter)
# 코드 끝

RSpec.describe 'Lambda' do
  it 'strings 라는 배열이 존재할 때 strings 의 내용을 symbol 로 변경하여 symbols 에 대입하는 구문을 작성하세요.' do
    expect(symbols).to eq([:leonardo, :donatello, :raphael, :michaelangelo])
  end

  it '배열에서 Symbol type 만 추려내는 lambda 함수를 만들고, 주어진 my_array.select 함수를 이용하여 Symbol 만 추려낸 배열을 symbols 변수에 넣어 보세요.' do
    expect(filtered_symbols).to eq([:inception, :avengers])
  end
end
