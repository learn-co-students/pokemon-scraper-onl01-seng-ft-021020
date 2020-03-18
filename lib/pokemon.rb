class Pokemon
  attr_accessor :name, :type
  
  attr_reader :id, :db
  def initialize(name:, type:, db:, id:)
    @name = name
    @type = type
    @id = id
    @db = db
    
  end
  
  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO Pokemon (name, type)
      VALUES (?, ?)
    SQL
    db.execute(sql, name, type)
  
  end
  
  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM Pokemon WHERE id=(?)
    SQL
    row = db.execute(sql, id)[0]
    
    return self.new(db: db, name: row[1], type: row[2], id: row[0])
  end
end
