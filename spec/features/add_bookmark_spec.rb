feature 'add bookmark' do
  scenario 'add a new bookmark to the list' do
    visit('/bookmarks/new')
    fill_in('url', with: 'google.com')
    click_button 'Submit'
    expect(page).to have_content 'google.com'
  end
end
