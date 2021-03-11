class Song 
  
  attr_accessors :title, :length 
  
  def self.new_from_db
    new_song = self.new 
    new_song.id = row[0]
    new_song.name = row[1]
    new_song.length = row[2]
    new_song
  end 
  
  def self.all 
    sql = <<-SQL 
      SELECT * FROM songs 
      WHERE name = ?
      LIMIT 1
    SQL 
  
    DB[:conn].execute(sql, name).map do |row|
    self.new_from_db(row)
    end.first 
  end
end 