class Pokemon

  attr_accessor :name, :type, :db, :id

  @@all = []

  def initialize(db)
    @name = name
    @type = type
    @db = db
    @id = id
  end

  def self.all
    @@all
  end

  def self.save(pk_name, pk_type, db)
    pokemon = Pokemon.new(db)
    pokemon.db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", pk_name, pk_type)
  end

  def self.find(id, db)
    pokemon = Pokemon.new(db)
    pokemon.name = db.execute ("SELECT name FROM pokemon WHERE id=?", id).flatten[0]
    pokemon.type = db.execute ("SELECT name FROM pokemon WHERE id=?", id).flatten[0]
    pokemon.id = id
    pokemon
  end

end
