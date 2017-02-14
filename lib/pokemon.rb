class Pokemon
attr_accessor :name, :type, :db, :id

  def initialize(name:, type:, db:, id:)
    @name = name
    @type = type
    @db = db
    @id = id
  end


  def self.save(name, type,db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
end

  def self.find (id, db)
    new_pokemon = db.execute("SELECT * FROM pokemon WHERE id = #{id}").first 
    pokemon = Pokemon.new(name: new_pokemon[1], type: new_pokemon[2], db: db, id: new_pokemon[0])
    pokemon
  end


end
