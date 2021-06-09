# frozen_string_literal: true

require 'rspec'

=begin
  while, until, for 외에도 좀 더 쉽게 iteration 이 가능한 구문을 소개
  소개할 타입 : 03_loop, .upto, .downto, .each, .times

  03_loop {
    break if [빠져나가는 조건]
  }

  10.upto(100) { |n| puts n }
  10.upto(100) do |n|
    puts n
  end

  10.downto(1) { |n| puts n }
  10.downto(1) do |n|
    puts n
  end

  10.times { |n| puts n }
  10.times do |n|
    puts n
  end

  (1..10).each { |n| puts n }
  (1..10).each do |n|
    puts n
  end
=end

def iteration
  # 코드시작
  10.times do |n|
    puts n + 1
  end
  # 코드 끝
end


RSpec.describe 'Iteration' do
  it 'my_array 에 1 에서 10까지의 숫자가 들어간 배열을 할당하고, my_array 에 포함된 숫자를 출력하는 구문을 작성하세요.' do
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

    expect { iteration }.to output(msg).to_stdout
  end
end
