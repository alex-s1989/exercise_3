class Station
  attr_accessor :trains
  attr_reader :name
  
  def initialize(name)
    @name = name
    @trains = []
  end
  
  def arrival_train(train)
    trains << train
  end
  
  def departure_train(train)
    trains.delete(train)
  end
  
  def to_s
    name
  end

end
