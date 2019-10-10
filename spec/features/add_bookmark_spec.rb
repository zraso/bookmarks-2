feature 'add bookmark' do
  scenario 'add a new bookmark to the list' do
    visit('/bookmarks/new')
    fill_in('url', with: 'google.com')
    fill_in('title', with: 'Test Bookmark')
    click_button 'Submit'
    expect(page).to have_link('Test Bookmark', href: 'http://google.com') ###
  end
end
