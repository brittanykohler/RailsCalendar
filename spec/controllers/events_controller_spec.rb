require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let(:user) do
    User.create({name: "Taylor", bio: "#SquadGoals"})
  end

  describe "GET 'index'" do
    it "gets a success response and renders index template" do
      get :index, user_id: user.id
      expect(response.status).to eq 200
      expect(subject).to render_template :index
    end
  end

  # describe "GET 'show'" do
  #   it "gets a success response and renders show template" do
  #     get :show, user_id: user.id
  #     expect(response.status).to eq 200
  #     expect(subject).to render_template :index
  #   end
  end
end
