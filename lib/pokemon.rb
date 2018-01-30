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

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id_num, db)
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
    pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2],db: db)
  end

end
