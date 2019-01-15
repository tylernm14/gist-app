require "rails_helper"

RSpec.describe GFilesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/g_files").to route_to("g_files#index")
    end

    it "routes to #new" do
      expect(:get => "/g_files/new").to route_to("g_files#new")
    end

    it "routes to #show" do
      expect(:get => "/g_files/1").to route_to("g_files#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/g_files/1/edit").to route_to("g_files#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/g_files").to route_to("g_files#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/g_files/1").to route_to("g_files#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/g_files/1").to route_to("g_files#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/g_files/1").to route_to("g_files#destroy", :id => "1")
    end
  end
end
