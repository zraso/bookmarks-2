require 'pg'

class Bookmark
  attr_reader :id, :url, :title
  def self.all
    result = DatabaseConnection.query("SELECT * FROM bookmarks;")
    result.map do |bookmark|
      Bookmark.new(url: bookmark['url'], title: bookmark['title'], id: bookmark['id'])
    end
  end

  def self.create(url:, title:)
    result = DatabaseConnection.query("INSERT INTO bookmarks (title, url) VALUES('#{title}', 'http://#{url}') RETURNING id, url, title")
    Bookmark.new(url: result[0]['url'], title: result[0]['title'], id: result[0]['id'])
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id = #{id}")
  end

  def self.update(id:, url:, title:)
    result = DatabaseConnection.query("UPDATE bookmarks SET url = 'http://#{url}', title = '#{title}' WHERE id = #{id} RETURNING id, url, title;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = #{id};")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def initialize(id:, url:, title:)
    @id = id
    @url = url
    @title = title
  end

end
