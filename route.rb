class Route
  attr_reader :list_stations
  
  def initialize(start_station, finish_station)
    @list_stations = [start_station, finish_station]
  end
  
  def add_interval_stations(station)
    list_stations.insert(-2, station)
  end

  def delete_interval_stations(station)
    insert.delete(station)
  end

  def print_route
    list_stations.each { |station| puts station }
  end
  
end
