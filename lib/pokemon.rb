class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id: nil, name:, type:, db:)
    @id = id
    @name = name
    @type = type  
    @db = db
  end

  def self.save(name, type, db)
    pokemon = self.new(name: name, type: type, db: db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", pokemon.name, pokemon.type)
    pokemon.id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    pokemon
  end

  def self.find(id, db)
    pmon = db.execute("SELECT * FROM pokemon WHERE id = ?", id)[0]
    Pokemon.new(id: pmon[0], name: pmon[1], type: pmon[2], db: db) 
  end

end
