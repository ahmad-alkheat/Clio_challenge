require 'spec_helper'

feature 'Teams' do 

  let!(:user) { create(:user) }
  let!(:user2) { create(:user) }

  let!(:team) { create(:team) }
  
  before do
    login(user)
  end

  scenario 'change status' do 
    visit '/'
    click_link 'Edit'
    select "out", :from => "My Status"
    click_button 'Save'
    expect(page.current_url).to eq("http://www.example.com/users")
  end

  scenario "can not edit someone else's status' " do 
    visit '/users/2/edit'
    expect(page).to have_content("You can't edit other users' information")
  end


  scenario "join a team" do 
    visit '/teams'
    click_link 'join team'
    expect(page.current_url).to eq("http://www.example.com/teams/1")
    expect(page).to have_content("#{user.full_name}")
  end


  def login(user)
    page.driver.post user_session_path, 'user[email]' => user.email, 'user[password]' => user.password
  end

end




