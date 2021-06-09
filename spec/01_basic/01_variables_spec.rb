# frozen_string_literal: true

# 1. my_num 에 number 형의 값으로 30을 입력합니다.
# 2. my_boolean 에 boolean 형의 값으로 true를 입력합니다.
# 3. my_string 에 string 형의 값으로 'ruby' 를 입력합니다.
# 4. my_hash 에 name = 'dante', email = 'dante@example.com', age = 40 값을 가질 수 있도록 구성합니다.

require 'rspec'

# 코드 시작
# 코드 끝

RSpec.describe 'BasicVariables' do
  it 'my_num 에 30 값을 입력하세요' do
    expect(my_num).to eq(30)
  end

  it 'my_boolean 에 true 값을 입력하세요' do
    expect(my_boolean).to eq(true)
  end

  it 'my_string 에 "ruby" 를 입력하세요' do
    expect(my_string).to eq('ruby')
  end

  it 'my_hash 에 name = "dante", email, "dante@example.com", age = 40 을 입력하세요' do
    expect(my_hash[:name]).to eq('dante')
    expect(my_hash[:email]).to eq('dante@example.com')
    expect(my_hash[:age]).to eq(40)
  end
end
