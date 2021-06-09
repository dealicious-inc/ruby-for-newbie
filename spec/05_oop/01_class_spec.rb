# frozen_string_literal: true

# 1. Person 클래스는 이름과 나이를 입력받습니다.
# 2. display 라는 instance method 는 입력받은 이름과 나이정보를 토대로 일정한 정보를 표시할 수 있어야 합니다. (ex, "dante_20")

require 'rspec'

# 코드 시작
class Person
  attr_accessor :name, :age
  @@users = {}

  def initialize(name, age)
    @name = name
    @age = age
    @@users[name] = age
  end
  
  def display
    "#{name}_#{age}"
  end

  def self.users
    @@users
  end

  def self.get_age(name)
    @@users[name]
  end
end
# 코드 끝

RSpec.describe Person do
  before do
    @person = Person.new('dante', 48)
  end

  it '클래스는 이름과 나이를 받을 수 있어야 합니다' do
    expect(@person.name).to eq('dante')
    expect(@person.age).to eq(48)
  end

  it 'Person 클래스는 instance method 로 display 를 제공하고 "이름_나이" 정보를 제공합니다' do
    expect(@person.display).to eq('dante_48')
  end

  it 'Person 클래스에 Hash 타입의 users 라는 이름의 class instance 를 만들고 users[username] = age 형태로 값을 저장하는 코드를 작성하세요' do
    expect(Person.users).to eq({ 'dante' => 48 })
  end

  it 'Person 클래스에 get_age 라는 class method 를 만들고, 이름을 입력하면 해당 사용자의 나이가 반환되는 코드를 작성하세요' do
    expect(Person.get_age('dante')).to eq(48)
  end
end
