require 'rails_helper'

describe ProductsController, type: :controller do

  before do
    @user = FactoryBot.create(:user)
    @product = FactoryBot.create(:product)
    @admin = FactoryBot.create(:admin)
  end

  # -------------------------------------- GET INDEX

  describe 'GET #index' do
    context 'when a user opens index page' do
      it "renders index template" do
	       get :index
         expect(response).to render_template(:index)
	    end
    end
  end

  # -------------------------------------- GET SHOW

  describe 'GET #show' do
    context 'when a user opens show page of a product' do
      it 'renders show template' do
        get :show, params: { id: @product.id }
        expect(response).to render_template(:show)
      end
    end
  end

  # -------------------------------------- GET NEW

  describe 'GET #new' do

    context 'when a user is logged in' do

      before do
        sign_in @user
      end

      it "redirects to root" do
         get :new
         expect(response.status).to eq(302)
         expect(response).to redirect_to(root_path)
      end

    end

    context 'when a user is an admin' do

      before do
        sign_in @admin
      end

      it "renders new template" do
         get :new
         expect(response.status).to eq(200)
         expect(response).to render_template(:new)
      end
    end

    context 'when a user is not logged in' do
      it "redirects to login" do
         get :new
         expect(response.status).to eq(302)
         expect(response).to redirect_to(new_user_session_path)
      end
    end

  end

  # -------------------------------------- GET EDIT

  describe 'GET #edit' do

    context 'when a user is logged in' do

      before do
        sign_in @user
      end

      it "redirects to root" do
         get :edit, params: { id: @product.id }
         expect(response.status).to eq(302)
         expect(response).to redirect_to(root_path)
      end

    end

    context 'when a user is an admin' do

      before do
        sign_in @admin
      end

      it "renders edit template" do
         get :edit, params: { id: @product.id }
         expect(response.status).to eq(200)
         expect(response).to render_template(:edit)
      end
    end

    context 'when a user is not logged in' do
      it "redirects to login" do
         get :edit, params: { id: @product.id }
         expect(response.status).to eq(302)
         expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  # -------------------------------------- POST CREATE

  describe 'POST #create' do

      context 'when an admin submits a new product' do
           before do
             sign_in admin
             it 'creates a new product if valid' do
               post :create, params: { product: attributes_for(product) }
               expect(status).to be_ok
             end

             it 'rejects a new product if invalid' do
               post :create, params: { product: attributes_for(product) }
               expect(status).not_to be_ok
             end
           end
         end

  end

  # -------------------------------------- PUT UPDATE

  describe 'PUT #update' do

    context 'when an admin submits an update to a product' do
      before do
        sign_in admin
        it 'updates product if valid' do
          put :update, params: { product: product }
          expect(status).to be_ok
          expect(response).to redirect_to('show')
        end

        it 'does not update product if invalid' do
          put :update, params: { product: invalid_product }
          expect(response).not_to be_ok
          expect(response).to redirect_to('edit')
        end
      end
    end

  end

    # -------------------------------------- DELETE DESTROY

  describe 'DELETE #destroy' do

    context 'when a user is logged in' do

      before do
        sign_in @user
      end

      it "redirects to root" do
         get :destroy, params: { id: @user.id }
         expect(response.status).to eq(302)
         expect(response).to redirect_to(root_path)
      end

    end

    context 'when a user is an admin' do

      before do
        sign_in @admin
      end

      it "deletes product" do
        delete :destroy, params: { id: @product.id }
        expect(response).to redirect_to products_path
      end

    end

    context 'when a user is not logged in' do
      it "redirects to login" do
         get :destroy, params: { id: @user.id }
         expect(response.status).to eq(302)
         expect(response).to redirect_to(new_user_session_path)
      end
    end

  end

  # --------------------------------------

end
