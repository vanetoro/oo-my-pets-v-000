require 'pry'
class Owner
      attr_accessor :type, :name, :pets
  @@all = []
  
  
  def initialize(type)
    @type = type
    @@all << self
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end  
  
  def self.all
    @@all
  end
  
  def self.reset_all
    @@all.clear
  end  
  
  def self.count
    @@all.length
  end
  
  def species
   self.type
  end
  
  def say_species
    "I am a #{self.type}."
  end
  
  def name=(name)
    @name = name
  end
  
  def pets
    @pets 
  end
  
  def buy_fish(name)
    fish = Fish.new(name)
    self.pets[:fishes] << fish
  end
  
  def buy_cat(name)
    cat = Cat.new(name)
    self.pets[:cats] << cat
  end
  
  def buy_dog(name)
    dog = Dog.new(name)
    self.pets[:dogs] << dog
  end  
    
  def walk_dogs  
    self.pets[:dogs].each do |dog|
      dog.mood = 'happy'
    end
  end
  
  def play_with_cats
    self.pets[:cats].each do |cat|
      cat.mood = 'happy'
    end
  end  
  
  def feed_fish
    self.pets[:fishes].each do |fish|
      fish.mood = 'happy'
    end
  end  
  
  def sell_pets
    @pets.each_pair do | pet, instance|
      instance.each do | animal|
        animal.mood = 'nervous'
      end  
    end 
    binding.pry
    @pets[:dogs].clear
    @pets[:cats].clear
    @pets[:fishes].clear
  end
  
  def list_pets
    sentence = []
    @pets.map.each do | animal, instance|
      if animal == :fishes
        sentence << "I have #{instance.length} fish,"
      elsif
        animal == :dogs
          sentence << " #{instance.length} dog(s),"
        else
          sentence << " and #{instance.length} cat(s)."
      end
    end
    sentence.join
  end  
  
end