feature 'Deleting a bookmark' do
  scenario 'A user can delete a bookmark' do
    Bookmark.create(url: 'google.com', title: 'Google')
    visit('/bookmarks')
    expect(page).to have_link('Google', href: 'http://google.com') ###
    first('.bookmark').click_button 'Delete'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Google', href: 'http://google.com')
  end
end
