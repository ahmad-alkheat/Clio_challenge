require 'spec_helper'

feature 'Teams' do 

  let(:user) { create(:user) }
  let!(:team) { create(:team) }

  before do
    login(user)
  end

  scenario 'Create a team' do 
    visit '/teams'
    click_link 'New Team'
    fill_in 'Title', :with => 'developers'
    click_button 'Create Team'
    expect(page).to have_content("Team was successfully created")

  end

  scenario 'Delete a team' do 
    visit '/teams'
    expect { click_link 'Destroy' }.to change(Team, :count).by(-1)
  end

  scenario 'Edit a team' do 
    visit '/teams'
    click_link 'Edit'
    fill_in 'Title', :with => 'newTitle'
    click_button 'Update Team'
    expect(page).to have_content("Team was successfully updated")
  end

  
  def login(user)
    page.driver.post user_session_path, 'user[email]' => user.email, 'user[password]' => user.password
  end
end
