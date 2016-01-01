require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let (:user) do
    User.create(name: "Emily", bio: "Hiya", password: "p", password_confirmation: "p")
  end

  let(:user_params) do
    {
      user:{
        name: "Fred", bio:"A guy", password:"p", password_confirmation: "p"
      }
    }

    describe "User is logged out" do

      describe "GET #index" do
      end

      describe "GET #new" do

      end

      describe "POST #create" do

      end

      describe "GET #show" do

      end

      describe "GET #edit" do

      end

      describe "PATCH #update" do

      end

      describe "DELETE #destroy" do

      end

    end

    describe "User is logged in" do

    before (:each) do
      session[:user_id] = user.id
    end

    describe "GET #index" do
    end

    describe "GET #new" do

    end

    describe "POST #create" do

    end

    describe "GET #show" do

    end

    describe "GET #edit" do

    end

    describe "PATCH #update" do

    end

    describe "DELETE #destroy" do

    end

end
