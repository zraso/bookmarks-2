feature 'Update bookmark' do
  scenario 'put new information in given bookmark field' do
    bookmark = Bookmark.create(url: 'www.giggle.com', title: 'Giggle')
    visit('/bookmarks')
    expect(page).to have_link('Giggle', href: 'http://www.giggle.com') ###

    first('.bookmark').click_button "Update"
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/update"

    fill_in('url', with: 'www.google.com')
    fill_in('title', with: 'Google')
    click_button 'Update'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Giggle', href: 'http://www.giggle.com')
    expect(page).to have_link('Google', href: 'http://www.google.com')
  end
end
