require 'rails_helper'

describe UsersController, type: :controller do

  before do
    @user = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    @admin = FactoryBot.create(:admin)
  end

  describe 'GET #show' do

    context 'when a user is logged in' do

      before do
        sign_in @user
      end

      it 'loads correct user details' do
        get :show, params: { id: @user.id }
        expect(response.status).to eq(200)
        expect(assigns(:user)).to eq @user
      end

      it "the user can only access his own user profile" do
        get :show, params: { id: @user2.id }
        expect(response.status).to eq(302)
        expect(response).to redirect_to(root_path)
      end

    end

    context 'when a user is not logged in' do

      it 'redirects to login' do
        get :show, params: { id: @user.id }
        expect(response).to redirect_to(new_user_session_path)
      end

    end

    context 'when a user is an admin' do

      before do
        sign_in @admin
      end

      it 'the admin can access all user profiles' do
        get :show, params: { id: @admin.id }
        expect(response.status).to eq(200)
        expect(assigns(:user)).to eq @admin
      end

    end

  end

end
