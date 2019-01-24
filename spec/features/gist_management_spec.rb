require 'rails_helper'
require_relative '../support/sign_in_out'


RSpec.feature "Gist management", :type => :feature do
  before(:each) do
    @user = FactoryBot.create(:user)
    login_as(@user, :scope => :user)
  end

  describe 'new gists' do
    scenario "User creates a new gist", js: true do
      visit "/gists/new"

      fill_in "Description", :with => "My test gist"
      fill_in "Value", :with => "tyler"
      click_button "Add File"
      filename_field_ids = all(:id, /filename/).map { |e| e[:id] }
      contents_editor = all('.CodeMirror')

      filename_field_ids.zip(contents_editor).each_with_index do |fc, index|
        fill_in fc[0], with: "mytestfile_#{index + 1}.txt"
        fill_in_editor_field(fc[1], "my contents #{index + 1}")
        # contents_fields[index].set("my contents #{index+1}")
      end

      click_button "Create Gist"

      expect(page).to have_text("Gist was successfully created.")
      expect(page).to have_text("My test gist")
      expect(page).to have_text("tyler")
      expect(page).to have_text("mytestfile_1.txt")
      expect(page).to have_text("mytestfile_2.txt")
      expect(page).to have_text("my contents 1")
      expect(page).to have_text("my contents 2")
    end
  end

  describe 'updating gists' do

    let(:gist) {create(:gist_with_g_files, user: @user)}

    scenario "User updates a gist description", js: true do
      visit "/gists/#{gist.id}/edit"
      fill_in "Description", :with => "My updated test gist"

      click_button "Update Gist"

      expect(page).to have_text("Gist was successfully updated.")
      expect(page).to have_text("My updated test gist")
      expect(page).to have_text(gist.short_url.value)
      expect(page).to have_text(gist.g_files[0].filename)
      expect(page).to have_text(gist.g_files[1].filename)
      expect(page).to have_text(gist.g_files[0].contents)
      expect(page).to have_text(gist.g_files[1].contents)
    end
  end

  describe 'delete gists' do
    let(:gist) {create(:gist_with_g_files, user: @user)}

    scenario "User deletes a gist", js: true do
      visit "/gists/#{gist.id}/edit"
      click_on "Delete"
      click_on "Confirm"
      using_wait_time 2 do
        expect(current_path).to eq('/gists')
      end
      expect(page).to have_text("Gist was successfully deleted.")
    end
  end

  private

  def fill_in_editor_field(element, text)
    element.click
    field = element.find('textarea', visible: false)
    field.send_keys text
  end

  def have_editor_display(options)
    editor_display_locator = '.CodeMirror-code'
    have_css(editor_display_locator, options)
  end
end