class Train
  attr_reader :train_number, :type, :number_of_wagons, :speed, :route
  
  FREIGHT = :freight
  PASS = :pass
  
  def initialize(train_number, type, number_of_wagons, speed = 0)
    @train_number = train_number
    @type = type
    @number_of_wagons = number_of_wagons
    @speed = speed
  end
  
  def inc_speed(speed)
    @speed += speed
  end
  
  def stop
    @speed = 0
  end
  
  def change_number_of_wagons(add = false)
    return unless speed.zero?
    
    @number_of_wagons += (add ? 1 : -1)
  end
  
  def take_route(route)
    @index = 0
    @route = route
    current_station.arrival_train(self)
  end

  def current_station
    @route.list_stations[@index]
  end

  def move_ahead
    return 'last station' if @index == @route.list_stations.size - 1
    current_station.departure_train(self)
    @index  += 1
    current_station.arrival_train(self)
  end

  def move_back
    return 'starting station' if @index == 0
    current_station.departure_train(self)
    @index -= 1
    current_station.arrival_train(self)
  end

  def next_station
    return nil if current_station == @route.list_stations[-1]
    @route.list_stations[@index + 1]
  end

  def previous_station
    return nil if current_station == @route.list_stations[0]
    @route.list_stations[@index - 1]
  end

end
