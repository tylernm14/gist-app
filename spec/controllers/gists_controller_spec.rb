require 'rails_helper'

RSpec.describe GistsController, type: :controller do

  describe "GET #index" do

    let!(:gist) {create(:gist)}

    it "succeeds" do
      get :index
      expect(response).to be_successful
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template('index')
    end

  describe "GET #show"

    let!(:gist) {create(:gist)}

    it "succeeds" do
      get :show, params: {id: gist.id}
      expect(response).to be_successful
    end

    it "renders the show template" do
      get :show, params: {id: gist.id}
      expect(response).to render_template('show')
    end
  end

  describe "GET #new" do
    login_user
    it "succeeds" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    let!(:gist) {create(:gist)}
    it "succeeds" do
      get :edit, params: {id: gist.id}
    end
  end

  describe "POST #create" do
    context "valid params" do
      let!(:user) { create(:user)}
      let(:valid_nested_params) {
        attrs = {gist: attributes_for(:gist)}
        attrs[:gist][:user_id] = user.id
        attrs[:gist][:short_url_attributes] = { value: "tylerlink" }
        attrs[:gist][:g_files_attributes] =  {"0"=> {filename: "test.txt", contents: "contents"}.stringify_keys }
        attrs
      }
      login_user
      it "creates a new Gist" do
        puts valid_nested_params
        expect {
          post :create, params: valid_nested_params
        }.to change(Gist, :count).by(1)
      end

      it "creates a ShortUrl" do
        expect {
          post :create, params: valid_nested_params
        }.to change(ShortUrl, :count).by(1)
      end

      it "creates a GFile" do
        expect {
          post :create, params: valid_nested_params
        }.to change(GFile, :count).by(1)
      end
    end
  end

end


# RSpec.describe GistsController, type: :controller do
#
#   # This should return the minimal set of attributes required to create a valid
#   # Gist. As you add validations to GFile, be sure to
#   # adjust the attributes here as well.
#   before(:each) {
#   }
#   let(:valid_attributes) {
#     # skip("Add a hash of attributes valid for your model")
#     # attributes_for :gist, user: @user
#     attr_user =
#     attr_gist = attributes_for :gist
#     attr_short_url = attributes_for :short_url
#     attr_g_file = attributes_for :g_file
#
#     puts attr_user.inspect
#     puts attr_gist.inspect
#     puts attr_short_url.inspect
#     puts attr_g_file.inspect
#
#   }
#
#   let(:invalid_attributes) {
#     skip("Add a hash of attributes invalid for your model")
#   }
#
#   # This should return the minimal set of values that should be in the session
#   # in order to pass any filters (e.g. authentication) defined in
#   # GistsController. Be sure to keep this updated too.
#   let(:valid_session) { {} }
#
#   describe "GET #index" do
#     it "returns a success response" do
#       Gist.create! valid_attributes
#       get :index, params: {}, session: valid_session
#       expect(response).to be_successful
#     end
#   end
#
#   describe "GET #show" do
#     it "returns a success response" do
#       gist = Gist.create! valid_attributes
#       get :show, params: {id: gist.to_param}, session: valid_session
#       expect(response).to be_successful
#     end
#   end
#
#   describe "GET #new" do
#     it "returns a success response" do
#       get :new, params: {}, session: valid_session
#       expect(response).to be_successful
#     end
#   end
#
#   describe "GET #edit" do
#     it "returns a success response" do
#       gist = Gist.create! valid_attributes
#       get :edit, params: {id: gist.to_param}, session: valid_session
#       expect(response).to be_successful
#     end
#   end
#
#   describe "POST #create" do
#     context "with valid params" do
#       it "creates a new Gist" do
#         expect {
#           post :create, params: {gist: valid_attributes}, session: valid_session
#         }.to change(Gist, :count).by(1)
#       end
#
#       it "redirects to the created gist" do
#         post :create, params: {gist: valid_attributes}, session: valid_session
#         expect(response).to redirect_to(Gist.last)
#       end
#     end
#
#     context "with invalid params" do
#       it "returns a success response (i.e. to display the 'new' template)" do
#         post :create, params: {gist: invalid_attributes}, session: valid_session
#         expect(response).to be_successful
#       end
#     end
#   end
#
#   describe "PUT #update" do
#     context "with valid params" do
#       let(:new_attributes) {
#         skip("Add a hash of attributes valid for your model")
#       }
#
#       it "updates the requested gist" do
#         gist = Gist.create! valid_attributes
#         put :update, params: {id: gist.to_param, gist: new_attributes}, session: valid_session
#         gist.reload
#         skip("Add assertions for updated state")
#       end
#
#       it "redirects to the gist" do
#         gist = Gist.create! valid_attributes
#         put :update, params: {id: gist.to_param, gist: valid_attributes}, session: valid_session
#         expect(response).to redirect_to(gist)
#       end
#     end
#
#     context "with invalid params" do
#       it "returns a success response (i.e. to display the 'edit' template)" do
#         gist = Gist.create! valid_attributes
#         put :update, params: {id: gist.to_param, gist: invalid_attributes}, session: valid_session
#         expect(response).to be_successful
#       end
#     end
#   end
#
#   describe "DELETE #destroy" do
#     it "destroys the requested gist" do
#       gist = Gist.create! valid_attributes
#       expect {
#         delete :destroy, params: {id: gist.to_param}, session: valid_session
#       }.to change(Gist, :count).by(-1)
#     end
#
#     it "redirects to the gists list" do
#       gist = Gist.create! valid_attributes
#       delete :destroy, params: {id: gist.to_param}, session: valid_session
#       expect(response).to redirect_to(gists_url)
#     end
#   end
#
# end
