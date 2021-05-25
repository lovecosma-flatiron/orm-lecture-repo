class Song

    attr_accessor :title, :artist, :genre
    attr_reader :id
    @@all = []
    def initialize(title="", artist="", genre="")
        @id = nil
        @title = title
        @artist = artist
        @genre = genre
        @@all << self
    end

    def self.all
        @@all
    end 

    def save 
        sql = "INSERT INTO songs (title, artist, genre) VALUES (?, ?, ?)"
        DB[:conn].execute(sql, @title, @artist, @genre)
        @id = DB[:conn].execute("SELECT * FROM songs").last["id"]
    end 

    def update(attribute_hash)
        if attribute_hash[:title] 
            @title = attribute_hash[:title] 
        end
        if attribute_hash[:artist] 
            @artist = attribute_hash[:artist] 
        end
        if attribute_hash[:genre] 
            @genre = attribute_hash[:title] 
        end 

        DB[:conn].execute("UPDATE songs SET title = ?, artist = ?, genre = ? WHERE id = ?", @title, @artist, @genre, @id)
        DB[:conn].execute("SELECT * FROM songs WHERE id = ?", @id)
    end 

    def drop
        sql = "DELETE FROM songs WHERE id = ?"
        @@all = @@all.filter{|song| song.id != @id}
        DB[:conn].execute(sql, @id)
        puts "Successfully deleted song from songs table"
    end 


   def self.create_table 
    sql = "CREATE TABLE IF NOT EXISTS songs(
        id INTEGER PRIMARY KEY,
        title TEXT,
        artist TEXT,
        genre TEXT
    );"

    DB[:conn].execute(sql)
   end 

   def self.view_table 
    DB[:conn].execute("SELECT * FROM songs").each do |song|
        puts ""
        puts "Title: #{song['title']}"
        puts "Artist: #{song["artist"]}"
        puts "Genre: #{song["genre"]}"
        puts ""
        puts "--------------------------------"
        puts "" 
    end 
   end 

   def self.alter_table

   end 

   def self.drop_table
    DB[:conn].execute("DROP TABLE IF EXISTS songs")
   end 

   def self.find_by_id(id)
    sql = "SELECT * FROM songs WHERE id = ?"
    DB[:conn].execute(sql, id).first
   end 


end 