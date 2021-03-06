require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'
require_relative 'station'
require_relative 'route'

class Railway
  attr_reader :stations, :trains, :routes, :wagons
  
  def initialize
    @stations = []
    @trains = []
    @routes = []
    @wagons = []
  end
  
  def create_station(name)
    station = Station.new(name)
    self.stations << station
  end

  def create_cargo_train(train_number)
    train = CargoTrain.new(train_number)
    self.trains << train
  end
  
  def create_passenger_train(train_number)
    train = PassengerTrain.new(train_number)
    self.trains << train
  end

  def create_cargo_wagon(number)
    wagon = CargoWagon.new(number)
    self.wagons << wagon
  end

  def create_passenger_wagon(number)
    wagon = PassengerWagon.new(number)
    self.wagons << wagon
  end
  
  def create_route(start_station_index, finish_station_index)
    start_station = station_by_index(start_station_index)
    finish_station = station_by_index(finish_station_index)
    
    route = Route.new(start_station, finish_station)
    self.routes << route
  end
  
  def add_interval_stations(route_index, station_index)
    route = route_by_index(route_index)
    station = station_by_index(station_index)
    
    route.add_interval_stations(station)
  end

  def delete_interval_stations(route_index, station_index)
    route = route_by_index(route_index)
    station = station_by_index(station_index)
  
    route.delete_interval_stations(station)
  end

  def take_route(train_index, route_index)
    train = train_by_index(train_index)
    route = route_by_index(route_index)
    train.take_route(route)
  end
  
  def attach_wagon(train_index, wagon_index)
    train = train_by_index(train_index)
    wagon = wagon_by_index(wagon_index)
    train.attach_wagon(wagon)
  end
  
  def unhook_wagon(train_index, wagon_index)
    train = train_by_index(train_index)
    train.unhook_wagon(wagon_index)
  end

  def move_ahead(train_index)
    train = train_by_index(train_index)
    train.move_ahead
  end

  def move_back(train_index)
    train = train_by_index(train_index)
    train.move_back
  end
  
  def show_stations
    stations.each_index do |station_index|
      show_station(station_index)
    end
  end

  def show_station(station_index)
    station = station_by_index(station_index)
    
    puts "Station: #{station}"
    puts '  Trains:'
    station.trains.each do |train|
      puts train
    end
  end
  
  def stations_with_index
    
    stations.each_with_index { |station, index| puts "№ #{index} - #{station}"}
  end

  def trains_with_index
    trains.each_with_index { |train, index| puts "№ #{index} - #{train}"}
  end

  def routes_with_index
    routes.each_with_index { |route, index| puts "№ #{index} - #{route}"}
  end

  def wagons_with_index
    wagons.each_with_index { |wagon, index| puts "№ #{index} - #{wagon}"}
  end

  def train_by_index(index)
    trains[index]
  end
  
  private
  
  attr_writer :stations, :trains, :routes, :wagons
  
  def route_by_index(index)
    routes[index]
  end

  def station_by_index(index)
    stations[index]
  end
  
  def wagon_by_index(index)
    wagons[index]
  end
  
end
