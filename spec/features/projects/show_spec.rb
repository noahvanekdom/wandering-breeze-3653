require 'rails_helper'

RSpec.describe 'Projects Show Page' do
  before(:each) do
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

    @upholstery_tux = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
    @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)

    @upholstery_tux.contestants << @kentaro
    @upholstery_tux.contestants << @jay
  end
  describe 'As a user, when I visit a project show page' do
    it 'I see the name and material of the project' do
      visit "/projects/#{@upholstery_tux.id}"

      expect(page).to have_content(@upholstery_tux.name)
      expect(page).to have_content(@upholstery_tux.material)

      expect(page).to_not have_content(@lit_fit.name)
    end

    it 'also shows the theme of the challenge that the project belongs to' do

      visit "/projects/#{@upholstery_tux.id}"

      expect(page).to have_content(@upholstery_tux.challenge.theme)
    end

    it 'and the number of contestants tht have worked on that project' do
      visit "/projects/#{@upholstery_tux.id}"

      expect(page).to have_content("Total contestants on this project: 2")

      visit "/projects/#{@lit_fit.id}"

      expect(page).to have_content("Total contestants on this project: 0")
    end

    it 'and the average experience of those contestants' do
      visit "/projects/#{@upholstery_tux.id}"

      expect(page).to have_content(@upholstery_tux.contestant_avg_exp)
      expect(page).to have_content(10.5)
    end
  end
end



