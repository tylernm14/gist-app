require 'rails_helper'

RSpec.describe "g_files/edit", type: :view do
  before(:each) do
    @g_file = assign(:g_file, GFile.create!(
      :name => "MyString",
      :contents => "MyText",
      :references => ""
    ))
  end

  it "renders the edit g_file form" do
    render

    assert_select "form[action=?][method=?]", g_file_path(@g_file), "post" do

      assert_select "input[name=?]", "g_file[name]"

      assert_select "textarea[name=?]", "g_file[contents]"

      assert_select "input[name=?]", "g_file[references]"
    end
  end
end
