# frozen_string_literal: true

require 'rspec'

fibs = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]

# 코드 시작
doubled_fibs = fibs.collect { |num| num * 2 }

def print_hello
  yield
end

def block_method
  return 'no block method' unless block_given?

  'block return'
end

def print_name(name)
  yield name if block_given?
end

# 코드 끝

RSpec.describe 'Block' do
  it '"print_hello"라는 method 를 만들고, print_hello method 와 block 구문을 이용하여 "Hello Block!" 이라는 문자를 출력하도록 코드를 작성하세요' do
    expect(print_hello { 'Hello Block!' }).to eq('Hello Block!')
  end

  it 'fibs 로 되어 있는 배열에 피보나치 수열이 담겨있습니다. "doubled_fibs" 변수를 만들고 ".collect" method 를 이용하여 두 배의 값을 담고 있는 배열을 새롭게 만드세요.' do
    output = [2, 2, 4, 6, 10, 16, 26, 42, 68, 110]
    expect(doubled_fibs).to eq(output)
  end

  it '"block_method" 라는 method를 만들고 block 이 존재하면 block 내의 코드를 수행하고, 그렇지 않다면 "no block method" 라는 문자열을 출력하는 코드를 작성하세요.' do
    expect(block_method).to eq('no block method')
    expect(block_method { return 'block return' }).to eq('block return')
  end

  it '"print_name" 이라는 method를 만들고 해당 method 에 "dante" 라는 이름을 인자로 넘길 때, "My name is dante" 라는 값이 출력되는 코드를 작성하세요.' do
    expect(print_name('dante') { |name| "My name is #{name}" }).to eq('My name is dante')
  end
end
