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
  end

  let(:bad_user_params) do
    {
      user:{
        name: "Fred", bio:"A guy", password:"p", password_confirmation: "q"
      }
    }
  end

    describe "User is logged out" do

      describe "GET #index" do
        it "responds successfully with an HTTP 200 status code" do
          get :index
          expect(response).to be_success
          expect(response).to have_http_status(200)
        end
        it "renders the index template" do
          get :index
          expect(response).to render_template("index")
        end
      end

      describe "GET #new" do
        it "responds successfully with an HTTP 200 status code" do
          get :new
          expect(response).to be_success
          expect(response).to have_http_status(200)
        end
        it "renders the new template" do
          get :new
          expect(subject).to render_template :new
        end
      end

      describe "POST #create" do
        it "redirects to user show page" do
          post :create, user_params
          expect(subject).to redirect_to user_path(assigns(:user))
        end
        it "creates a new user" do
          original_count = User.all.count
          post :create, user_params
          expect(User.all.count).to eq original_count + 1
        end
        it "renders new template on error" do
          post :create, bad_user_params
          expect(subject).to render_template :new
        end
      end

      describe "GET #show" do
        it "is not successful and redirects" do
          get :show, id: user.id
          expect(response).to have_http_status(302)
        end
        it "redirects to the log in page" do
          get :show, id: user.id
          expect(subject).to redirect_to new_session_path
        end
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
      it "responds successfully with an HTTP 200 status code" do
        get :index
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
      it "renders the index template" do
        get :index
        expect(response).to render_template("index")
      end
    end

    describe "GET #new" do
      it "is not successful and redirects" do
        get :new
        expect(response).to have_http_status(302)
      end
      it "redirects to the user show page" do
        get :new
        expect(subject).to redirect_to user_path(user)
      end
    end

    describe "POST #create" do
      it "is not successful and redirects" do
        post :create, user_params
        expect(response).to have_http_status(302)
      end
      it "does not create a new user" do
        original_count = User.all.count
        post :create, user_params
        expect(User.all.count).to eq original_count
      end
      it "redirects to the user show page" do
        get :new
        expect(subject).to redirect_to user_path(user)
      end
    end

    describe "GET #show" do
      it "responds successfully with an HTTP 200 status code" do
        get :show, id: user.id
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
      it "renders the show template" do
        get :show, id: user.id
        expect(subject).to render_template :show
      end
    end

    describe "GET #edit" do

    end

    describe "PATCH #update" do

    end

    describe "DELETE #destroy" do

    end
  end
end
