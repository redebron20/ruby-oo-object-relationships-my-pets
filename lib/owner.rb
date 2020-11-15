require 'pry'
class Owner
  # code goes here
  attr_accessor
  attr_reader :name, :species

  @@all = []
  #@@pets = {:dogs => [], :cats => []}

  def initialize(name, species = "human")
    @name = name
    @species = species
    @cats = Cat.all.select {|cat| cat.owner == self}
    @dogs = Dog.all.select {|dog| dog.owner == self} 
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def say_species
    "I am a #{species}."
  end

  def self.count
    self.all.count
  end

  def cats
    Cat.all.select {|cat| cat.owner == self} 
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self} 
  end

  def buy_cat(name)
    new_cat = Cat.new(name, self)
    cats << new_cat
  end

  def buy_dog(name)
    new_dog = Dog.new(name, self)
    dogs << new_dog
  end

  def walk_dogs
    Dog.all.each do |dog|
      dog.mood = "happy" #if dog.owner == self
    end
  end

  def feed_cats
    Cat.all.each do |cat|
      cat.mood = "happy" #if cat.owner == self
    end
  end

  def sell_pets
    Cat.all.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end

    Dog.all.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

  def self.reset_all
    self.all.clear
  end

end