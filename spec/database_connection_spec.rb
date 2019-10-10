require 'database_connection'

describe DatabaseConnection do

  describe '.setup' do
    it 'sets up connection to given database' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')

      DatabaseConnection.setup('bookmark_manager_test')
    end
  end
  # 
  # describe '.connection' do
  #   it 'connection is persistent' do
  #     connection = DatabaseConnection.setup('bookmark_manager_test')
  #     expect(DatabaseConnection.connection).to eq connection
  #   end
  # end

  describe '.query' do
    it 'executes a given SQL query string' do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(connection).to receive(:exec).with("SELECT * FROM bookmarks;")
      DatabaseConnection.query("SELECT * FROM bookmarks;")
    end
  end
end
