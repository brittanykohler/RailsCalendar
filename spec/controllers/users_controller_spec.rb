require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let (:user) do
    User.create(name: "Emily", bio: "Hiya", password: "p", password_confirmation: "p")
  end

  let(:new_user_params) do
    {
      user:{
        name: "Fred", bio:"A guy", password:"p", password_confirmation: "p"
      }
    }

    let(:update_user_params) do
      {
        user:{
          name: "Fred2", bio:"A great guy", password:"p", password_confirmation: "p"
        }
        id: 1
      }

  describe "User is logged in" do

    before (:each) do
      session[:user_id] = user.id
    end

  end

  describe "User is logged out" do

  end

end
