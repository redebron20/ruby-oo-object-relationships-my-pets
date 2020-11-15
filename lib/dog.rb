class Dog
  # code goes here
  attr_accessor :mood
  attr_reader :name, :owner

  @@all = []
  
  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def owner=(owner)
    @owner = owner
    owner.dogs.push(self) unless self.owner.nil?
  end

end