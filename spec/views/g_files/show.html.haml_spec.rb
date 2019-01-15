require 'rails_helper'

RSpec.describe "g_files/show", type: :view do
  before(:each) do
    @g_file = assign(:g_file, GFile.create!(
      :name => "Name",
      :contents => "MyText",
      :references => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
