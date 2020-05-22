require 'rails_helper'

RSpec.describe 'on an actors show page' do
  before(:each) do
    @mgm = Studio.create(name:"MGM", location:"Hollywood")
    @lionsgate = Studio.create(name:"Lions Gate", location:"Hollywood")

    @scream = Movie.create(title:"Scream", year: 1998, genre:"Horror", studio_id: @mgm.id)
    @space_jam = Movie.create(title:"Space Jam", year: 1993, genre:"Comedy", studio_id: @lionsgate.id)

    @courtney = @scream.actors.create(name: "Courtney Cox", age: 56)
    @neve = @scream.actors.create(name: "Neve Campbell", age: 42)
    @rose = @scream.actors.create(name: "Rose McGowan", age: 46)

    @neve = @space_jam.actors.create(name: "Neve Campbell", age: 42)
    @courtney = @space_jam.actors.create(name: "Courtney Cox", age: 42)
    @bugs = @space_jam.actors.create(name: "Bugs Bunny", age: 42)
  end

  it 'can see actors info along with names of actors theyve worked with' do
    visit "/actors/#{@neve.id}"

    expect(page).to have_content(@neve.name)
    expect(page).to have_content(@neve.age)
    expect(page).to have_content(@courtney.name)
    expect(page).to have_content(@rose.name)
    expect(page).to have_content(@bugs.name)
  end
end

# Story 4
# As a visitor,
# When I visit an actor's show page
# I see that actors name and age 
# And I see a unique list of all of the actors this particular actor has worked with.