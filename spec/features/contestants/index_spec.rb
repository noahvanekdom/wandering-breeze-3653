require 'rails_helper'

RSpec.describe 'Contestant Index Page' do
  before(:each) do
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)

    @upholstery_tux = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
    @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")
    @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)

    @upholstery_tux.contestants << @gretchen
    @upholstery_tux.contestants << @jay

    @lit_fit.contestants << @jay
  end
  describe 'As a user, when I visit the contestant index page' do
    it 'I see a list of names of all the contestants' do
      visit '/contestants'

      expect(page).to have_content(@jay.name)
      expect(page).to have_content(@kentaro.name)
    end

    it 'And under each contestants name I see a list of the projects (names) that they have been on' do
      visit '/contestants'
      expect(page).to have_content(@upholstery_tux.name)
      expect(page).to_not have_content(@boardfit.name)

      expect(@jay.name).to appear_before(@lit_fit.name)
    end
  end
end
