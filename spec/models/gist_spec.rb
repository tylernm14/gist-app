require 'rails_helper'

RSpec.describe Gist, type: :model do

  describe "nested attribute validation" do
    let(:user) { create(:user) }

    it "has a valid factory" do
      expect(create(:gist_with_g_files, g_files_count: 2)).to be_valid
    end

  end
end