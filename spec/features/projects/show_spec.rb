require 'rails_helper'

RSpec.describe 'Projects Show Page' do
  before(:each) do
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

    @upholstery_tux = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
    @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
  end
  describe 'As a user, when I visit a project show page' do
    it 'I see the name and material of the project' do
      visit "/projects/#{@upholstery_tux.id}"

      expect(page).to have_content(@upholstery_tux.name)
      expect(page).to have_content(@upholstery_tux.material)
    end

    xit 'also shows the theme of the challenge that the project belongs to' do

      visit "/projects/#{@project_1.id}"

      #expect(page).to have_content(ACCESS CHALLENGE THEME)
    end
  end
end



