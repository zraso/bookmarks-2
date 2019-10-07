feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end
end

feature 'Viewing all bookmarks' do
  scenario 'visiting the bookmarks page' do
    visit('/bookmarks')
    expect(page).to have_content "http://makersacademy.com"
    expect(page).to have_content "http://google.co.uk"
    expect(page).to have_content "http://ebay.co.uk"
  end
end
