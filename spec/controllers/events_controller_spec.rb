require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let(:user) do
    User.create({name: "Taylor", bio: "#SquadGoals"})
  end

  let(:event) do
    Event.create({name: "Fill that blank space", description: "I guess I'll write your name", event_date: Date.new(2015, 12, 25).to_datetime + Time.parse("17:30").seconds_since_midnight.seconds, user_id: 1})
  end

  describe "GET 'index'" do
    it "gets a success response and renders index template" do
      get :index, user_id: user.id
      expect(response.status).to eq 200
      expect(subject).to render_template :index
    end
  end
end
