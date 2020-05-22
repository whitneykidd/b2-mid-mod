require 'rails_helper'

RSpec.describe Actor do
  before(:each) do
    @courtney = Actor.create(name: "Courtney Cox", age: 56)
    @neve = Actor.create(name: "Neve Campbell", age: 42)
    @rose = Actor.create(name: "Rose McGowan", age: 46)
    @actors = Actor.all
  end

  describe 'methods' do
    it '#order_by_age' do
      expect(@actors.order_by_age).to eq([@neve, @rose, @courtney])
    end

    it '#average_age' do
      expect(@actors.average_age).to eq(48)
    end
  end
end