require 'rails_helper'

RSpec.describe 'on the studio index page' do
  it 'can see a list of studios with their movie names underneath' do
    mgm = Studio.create(name:"MGM", location:"Hollywood")
    lionsgate = Studio.create(name:"Lions Gate", location:"LA")
    space_jam = Movie.create(title:"Space Jame", year: 1993, genre:"Comedy", studio_id: mgm.id)
    scream = Movie.create(title:"Scream", year: 1998, genre:"Horror", studio_id: mgm.id)
    old_school = Movie.create(title:"Old School", year: 2001, genre:"Comedy", studio_id: lionsgate.id)

    visit '/studios'

    within(".studio-#{mgm.id}") do
      expect(page).to have_content(mgm.name)
      expect(page).to have_content(space_jam.title)
      expect(page).to have_content(scream.title)
      expect(page).to have_no_content(old_school.title)
    end

    within(".studio-#{lionsgate.id}") do
      expect(page).to have_content(lionsgate.name)
      expect(page).to have_content(old_school.title)
      expect(page).to have_no_content(scream.title)
    end
  end
end

# Story 1
# As a visitor,
# When I visit the studio index page
# I see a list of all of the movie studios
# And underneath each studio, I see the names of all of its movies.