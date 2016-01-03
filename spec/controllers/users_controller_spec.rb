require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let (:user) do
    User.create(name: "Emily", bio: "Hiya", password: "p", password_confirmation: "p")
  end

  let (:another_user) do
    User.create(name: "Heyo", bio: "Whoah", password: "q", password_confirmation: "q")
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
  let(:update_user_params) do
    {
      user:{
        name: "New name", bio:"A guy", password:"p", password_confirmation: "p"
      },
      id: user.id
    }
  end
  let(:update_another_user_params) do
    {
      user:{
        name: "New name", bio:"what"
      },
      id: another_user.id
    }
  end

  let(:bad_update_user_params) do
    {
      user:{
        name: nil, bio:"A guy"
      },
      id: user.id
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
        it "is not successful and redirects" do
          get :edit, id: user.id
          expect(response).to have_http_status(302)
        end
        it "redirects to the log in page" do
          get :edit, id: user.id
          expect(subject).to redirect_to new_session_path
        end
      end

      describe "PATCH #update" do
        it "is not successful and redirects" do
          patch :update, update_user_params
          expect(response).to have_http_status(302)
        end
        it "redirects to the log in page" do
          patch :update, update_user_params
          expect(subject).to redirect_to new_session_path
        end
        it "does not update the user" do
          patch :update, update_user_params
          expect(User.find(user.id).attributes).to eq user.attributes
        end
      end

      describe "DELETE #destroy" do
        it "is not successful and redirects" do
          delete :destroy, id: user.id
          expect(response).to have_http_status(302)
        end
        it "redirects to the log in page" do
          delete :destroy, id: user.id
          expect(subject).to redirect_to new_session_path
        end
        it "does not delete the user" do
          delete :destroy, id: user.id
          expect(User.all).to include(user)
        end
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
      it "responds successfully with an HTTP 200 status code" do
        get :edit, id: user.id
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
      it "renders the edit template" do
        get :edit, id: user.id
        expect(subject).to render_template :edit
      end

    end

    describe "PATCH #update" do
      it "redirects to the page they came from" do
        session[:return_to] = user_path(user)
        patch :update, update_user_params
        expect(subject).to redirect_to user_path(user)
      end
      it "goes to the root path if there is no referer" do
        patch :update, update_user_params
        expect(subject).to redirect_to root_path
      end
      it "updates the user" do
        patch :update, update_user_params
        expect(User.find(user.id).attributes).not_to eq user.attributes
      end
      it "renders edit template on error" do
        patch :update, bad_update_user_params
        expect(subject).to render_template :edit
      end
      it "does not allow user to edit another user" do
        patch :update, update_another_user_params
        expect(User.find(another_user.id).attributes).to eq another_user.attributes
      end
      it "redirects to edit current user if you attempt to edit another user" do
        patch :update, update_another_user_params
        expect(subject).to redirect_to edit_user_path(user)
      end
    end

    describe "DELETE #destroy" do
      it "redirects to the home page" do
        delete :destroy, id: user.id
        expect(subject).to redirect_to root_path
      end
      it "deletes the user" do
        delete :destroy, id: user.id
        expect(User.all).to_not include(user)
      end
      it "does not allow the user to delete another user" do
        delete :destroy, id: another_user.id
        expect(User.all).to include(another_user)
      end
    end
  end
end
