feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end
end

feature 'Viewing all bookmarks' do
  scenario 'visiting the bookmarks page' do
    Bookmark.create(url: "http://www.makersacademy.com", title: 'Makers Academy')
    Bookmark.create(url: "http://www.ebay.co.uk", title: "Ebay is great")
    Bookmark.create(url: "http://www.google.co.uk", title: "Googles aight")

    visit('/bookmarks')

    expect(page).to have_link('Makers Academy', href: "http://www.makersacademy.com")
    expect(page).to have_link('Ebay is great', href: "http://www.ebay.co.uk")
    expect(page).to have_link("Googles aight", href: "http://www.google.co.uk")
  end
end
