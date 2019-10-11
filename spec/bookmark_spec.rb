require 'bookmark'
require 'database_helpers'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers')
      Bookmark.create(url: 'http://www.ebay.co.uk', title: 'Ebay')
      Bookmark.create(url: 'http://www.google.co.uk', title: 'Google')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.google.com', title: 'Test Bookmark')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.url).to eq 'http://www.google.com'
      expect(bookmark.title).to eq 'Test Bookmark'
    end

    it 'does not create a new bookmark if the URL is not valid' do
      Bookmark.create(url: 'not a real bookmark', title: 'not a real bookmark')
      expect(Bookmark.all).not_to include 'not a real bookmark'
    end
  end

  describe '.delete' do
    it "deletes a bookmark" do
      bookmark = Bookmark.create(url: "http://www.google.com", title: "Google")
      Bookmark.delete(id: bookmark.id)
      expect(Bookmark.all).not_to include bookmark
    end
  end

  describe '.update' do
    it 'updates a bookmark with given data' do
      bookmark = Bookmark.create(url: "http://www.giggle.com", title: "Giggle")
      updated_bookmark = Bookmark.update(id: bookmark.id, url: "http://www.google.com", title: "Google")
      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.title).to eq "Google"
      expect(updated_bookmark.url).to eq "http://www.google.com"
    end
  end

  describe '.find' do
    it 'returns a bookmark with given id' do
      bookmark = Bookmark.create(url: "http://www.google.com", title: "Google")
      result = Bookmark.find(id: bookmark.id)

      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq "Google"
      expect(result.url).to eq "http://www.google.com"
    end
  end
  #
  # describe 'valid_url?' do
  #   it 'checks if url entered is valid' do
  #     bookmark = Bookmark.create(url: "google.com", title: "Google")
  #     result = Bookmark.valid_url?
  #     expect(result).to eq false
  #   end
  # end
end
