# frozen_string_literal: true

require 'rspec'

# 코드 시작
class Person
  def initialize(name, age)
    @name = name
    @age = age
  end

  def name
    @name
  end

  protected

  def display
    "#{@name}_#{@age}"
  end

  private

  def secret
    @age
  end
end

class User < Person
end
# 코드 끝

RSpec.describe 'Module' do
  before do
    @person = Person.new('dante', 0)
    @user = User.new('dante', 48)
  end

  it 'name, age 를 갖는 Person 클래스가 존재합니다. "name" 은 공개가 되어도 되지만 "age" 는 비밀입니다. Person 클래스를 작성해 보세요' do
    expect(@person.name).to eq('dante')
    # expect(@person.display).to eq('dante_0')
    expect(@person.send(:secret)).to eq(0)
  end

  it 'Person 을 상속받은 User 클래스를 만들고, display 라는 protected 함수를 만들어 "dante_48" 형태의 출력을 만들어보세요.' do
    expect(@user.send(:display)).to eq('dante_48')
  end
end
