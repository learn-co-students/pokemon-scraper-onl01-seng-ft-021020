class Pokemon
    attr_accessor :name, :type
    attr_reader :id, :db
    
    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES (?, ?)
        SQL

        db.execute(sql, name, type)
        @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end

    def self.find(id, db)
        sql = <<-SQL
            SELECT * FROM pokemon
            WHERE id = ?
        SQL

        pokarray = db.execute(sql, id).flatten
        name = pokarray[1]
        type = pokarray[2]

        new_pokemon = Pokemon.new(id: id, name: name, type: type, db: db)
        new_pokemon
    end
end
