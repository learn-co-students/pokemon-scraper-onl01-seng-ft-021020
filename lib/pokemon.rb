class Pokemon
  attr_accessor :id, :name, :type, :db 
  
  def initialize(keywords)
    
  end
  
  def self.save(name, type, db) 
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end
  
  def self.find(id, db) 
    row = db.execute("SELECT * FROM pokemon WHERE id=?", [id])
    new_pokemon = self.new(row) 
    new_pokemon.id = row[0][0]
    new_pokemon.name = row[0][1]
    new_pokemon.type = row[0][2]
    new_pokemon
  end
    
  
end
