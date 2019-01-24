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


