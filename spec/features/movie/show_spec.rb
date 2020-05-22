require 'rails_helper'

RSpec.describe 'on a movies show page' do
  it 'can see a movies attributes' do
    mgm = Studio.create(name:"MGM", location:"Hollywood")
    # lionsgate = Studio.create(name:"Lions Gate", location:"LA")
    # space_jam = Movie.create(title:"Space Jam", year: 1993, genre:"Comedy", studio_id: mgm.id)
    scream = Movie.create(title:"Scream", year: 1998, genre:"Horror", studio_id: mgm.id)
    # old_school = Movie.create(title:"Old School", year: 2001, genre:"Comedy", studio_id: lionsgate.id)
    courtney_cox = scream.actors.create(name: "Courtney Cox", age: 56)
    neve_campbell = scream.actors.create(name: "Neve Campbell", age: 42)
    rose_mcgowan = scream.actors.create(name: "Rose McGowan", age: 46)

    visit "/movies/#{scream.id}"

    # within(".studio-#{mgm.id}") do
      expect(page).to have_content(scream.title)
      expect(page).to have_content(scream.year)
      expect(page).to have_content(scream.genre)
      # expect(page).to have_no_content(old_school.title)
    # end

    # within(".studio-#{lionsgate.id}") do
      expect(neve_campbell).to appear_before(rose_mcgowan)
      expect(rose_mcgowan).to appear_before(courtney_cox)
      # expect(page).to have_no_content(scream.title)
      # save_and_open_page
    # end
  end
end




# Story 2
# As a visitor,
# When I visit a movie's show page.
# I see the movie's title, creation year, and genre,
# and a list of all its actors from youngest to oldest.
# And I see the average age of all of the movie's actors