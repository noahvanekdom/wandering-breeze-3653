require 'rails_helper'


RSpec.describe Project, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :material}
  end

  describe "relationships" do
    it {should belong_to :challenge}
    it {should have_many :contestant_projects}
    it {should have_many(:contestants).through(:contestant_projects)}
  end

  describe "methods" do
    before(:each) do
      @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
      @upholstery_tux = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
      @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      @upholstery_tux.contestants << @jay
    end
    it '#contestant_count' do

      expect(@upholstery_tux.contestant_count).to eq 1
    end

    it '#contestant_avg_exp' do

      expect(@upholstery_tux.contestant_avg_exp). to eq 0
    end
  end
end