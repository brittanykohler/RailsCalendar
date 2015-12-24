require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let(:user) do
    User.create({name: "Taylor", bio: "#SquadGoals"})
  end

  let(:event) do
    Event.create({name: "Fill that blank space", description: "I guess I'll write your name", event_date: Date.new(2015, 12, 25).to_datetime + Time.parse("17:30").seconds_since_midnight.seconds, user_id: 1})
  end

  let(:event_params) do
    {
      event: {
        name: "Fill that blank space",
        description: "I guess I'll write your name",
        "event_date(1i)" => "2015",
        "event_date(2i)"=>"12",
        "event_date(3i)"=>"24",
        "event_date(4i)"=>"00",
        "event_date(5i)"=>"00"
      },
      user_id: 1
    }
  end

  describe "GET 'index'" do
    it "gets a success response and renders index template" do
      get :index, user_id: user.id
      expect(response.status).to eq 200
      expect(subject).to render_template :index
    end
  end

  describe "GET 'show'" do
    it "gets a success response and renders show template" do
      get :show, user_id: user.id, id: event.id
      expect(response.status).to eq 200
      expect(subject).to render_template :show
    end
  end

  describe "GET 'new'" do
    it "gets a success response and renders new template" do
      get :new, user_id: user.id, cal_date: Time.now
      expect(response.status).to eq 200
      expect(subject).to render_template :new
    end
  end

  describe "POST 'create'" do
    it "redirects to user_events_path" do
      post :create, event_params
      expect(response.status).to eq 302
      expect(subject).to redirect_to user_events_path(1)
    end
    it "successfully creates event" do
      expect(Event.all.length).to eq 0
      post :create, event_params
      expect(Event.all.length).to eq 1
    end
  end

  describe "DELETE 'destroy'" do
    before :each do
      post :create, event_params
    end
    it "redirects to user_events_path" do
      delete :destroy, user_id: user.id, id: event.id
      expect(response.status).to eq 302
      expect(subject).to redirect_to user_events_path(1)
    end
    it "successfully deletes event" do
      expect(Event.all.length).to eq 1
      delete :destroy, user_id: user.id, id: 1
      expect(Event.all.length).to eq 0
    end
  end
end
