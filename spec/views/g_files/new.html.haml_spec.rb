require 'rails_helper'

RSpec.describe "g_files/new", type: :view do
  before(:each) do
    assign(:g_file, GFile.new(
      :name => "MyString",
      :contents => "MyText",
      :references => ""
    ))
  end

  it "renders new g_file form" do
    render

    assert_select "form[action=?][method=?]", g_files_path, "post" do

      assert_select "input[name=?]", "g_file[name]"

      assert_select "textarea[name=?]", "g_file[contents]"

      assert_select "input[name=?]", "g_file[references]"
    end
  end
end
