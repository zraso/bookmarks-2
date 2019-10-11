feature 'URL error' do
  scenario 'flashes up an error when url entered by user is not valid' do
    visit('bookmarks/new')
    fill_in('url', with: 'error url')
    fill_in('title', with: 'error title')
    click_button 'Submit'
    expect(page).not_to have_content "error url"
    expect(page).to have_content "You must submit a valid URL"
  end
end
