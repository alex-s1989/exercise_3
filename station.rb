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
  
  def trains_by_type(type)
    trains.select { |train| train.type == type }
  end
  
  def count_trains_by_type(type)
    trains_by_type(type).size
  end

end
