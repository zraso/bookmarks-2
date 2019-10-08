require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      #add the test data
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.ebay.co.uk');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.co.uk');")

      bookmarks = Bookmark.all
      
      expect(bookmarks).to include 'http://www.makersacademy.com'
      expect(bookmarks).to include 'http://www.ebay.co.uk'
      expect(bookmarks).to include 'http://www.google.co.uk'
    end
  end
end