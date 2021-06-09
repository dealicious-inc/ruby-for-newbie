# frozen_string_literal: true

# 1. str 값에 "Ruby World" 를 대입합니다.
# 2. ruby 값이 "dlroW ybuR" 로 출력되도록 처리합니다.
# 3. small 값에 "ruby" 를 입력한 뒤 "Ruby" 가 출력되도록 만드세요.
# 4. big 값에 "RUBY" 를 입력한 뒤 "ruby" 가 출력되도록 만드세요.
# 5. name 값에 "ruby" 를 입력한 뒤 "RUBY" 가 출력되도록 만드세요.

# !함수를 호출 할 때 chain 으로 호출될 수 있습니다.
# !함수를 호출 할 때 () 를 생략할 수 있습니다.

require 'rspec'

# 코드시작
# 코드 끝

RSpec.describe 'BasicString' do
  it 'str 변수에 "Ruby World" 값을 입력하고 "dlroW ybuR" 이 출력되도록 만드세요' do
    expect(str).to eq('dlroW ybuR')
  end

  it 'ruby 변수에 "ruby" 값을 입력하고 "Ruby" 이 출력되도록 만드세요' do
    expect(ruby).to eq('Ruby')
  end

  it 'small 변수에 "RUBY" 를 입력한 뒤 "ruby" 가 출력되도록 만드세요' do
    expect(small).to eq('ruby')
  end

  it 'big 변수에 "ruby" 를 입력한 뒤 "RUBY" 가 출력되도록 만드세요.' do
    expect(big).to eq('RUBY')
  end

  it 'name 변수에 "Dante" 를 입력한 뒤 소문자로 만들고, 역순으로 만든 뒤, 대문자로 만들어 보세요. 한줄에서 처리해 보세요' do
    expect(name).to eq('ETNAD')
  end
end
