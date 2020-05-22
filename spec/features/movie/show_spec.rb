require 'rails_helper'

RSpec.describe 'on a movies show page' do
  before(:each) do
    @mgm = Studio.create(name:"MGM", location:"Hollywood")
    @scream = Movie.create(title:"Scream", year: 1998, genre:"Horror", studio_id: @mgm.id)
    @courtney = @scream.actors.create(name: "Courtney Cox", age: 56)
    @neve = @scream.actors.create(name: "Neve Campbell", age: 42)
    @rose = @scream.actors.create(name: "Rose McGowan", age: 46)

    visit "/movies/#{@scream.id}"
  end

  it 'can see a movies attributes' do
    expect(page).to have_content(@scream.title)
    expect(page).to have_content(@scream.year)
    expect(page).to have_content(@scream.genre)

    within(".actors") do
      expect(@neve.name).to appear_before(@rose.name)
      expect(@rose.name).to appear_before(@courtney.name)
      expect(page).to have_content("Average Age: 48.0")
      expect(page).to have_no_content(@scream.title)
    end
  end

  it 'can fill in form with actors name' do
    
    within(".actor-search") do
      fill_in "Actor Name", with: "Neve Campbell"
      click_button "Submit"
    end
    
    expect(current_path).to eq("/movies/#{@scream.id}")
    expect(page).to have_content("Neve Campbell")
  end
end
