# frozen_string_literal: true

require 'rspec'

module Attackable
  def attack(power, agility, weapon = '')
    return puts '무기를 장착하지 않고는 공격할 수 없습니다.' if weapon == ''

    puts "#{weapon} 을 이용하여 분노의 일격을 가했습니다. #{damage(power, agility)} 의 공격을 입혔습니다."
  end

  def damage(power, agility)
    rand(100) < agility ? power * 2 : power
  end
end

class Assassin
  include Attackable

  def initialize(power, agility)
    @power = power
    @agility = agility
  end

  def hit
    attack(@power, @agility)
  end
end

class DaggerAssassin < Assassin
  def initialize(power, agility, weapon = 'dagger')
    super(power, agility)
    @weapon = weapon
  end

  def hit
    attack(@power, @agility, @weapon)
  end
end

class BowAssassin < Assassin
  def initialize(power, agility, weapon = 'bow')
    super(power, agility)
    @weapon = weapon
  end

  def hit
    attack(@power, @agility, @weapon)
  end
end

class BearAssassin < Assassin
end

dante = DaggerAssassin.new(50, 20)
shim = BowAssassin.new(30, 25)
jeejon = BearAssassin.new(80, 80)

dante.hit
shim.hit
jeejon.hit

RSpec.describe 'Assassin' do
  it 'RPG 게임을 만들어 봅시다' do
  end
end
