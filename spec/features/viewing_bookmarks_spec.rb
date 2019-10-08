feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end
end

feature 'Viewing all bookmarks' do
  scenario 'visiting the bookmarks page' do
    Bookmark.add_bookmark(url: "http://www.makersacademy.com")
    Bookmark.add_bookmark(url: "http://www.ebay.co.uk")
    Bookmark.add_bookmark(url: "http://www.google.co.uk")

    visit('/bookmarks')

    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.google.co.uk"
    expect(page).to have_content "http://www.ebay.co.uk"
  end
end
