class ElevatorController
  def initialize(options)
    @elevators = []
    @bottom_floor = options[:bottom_floor] || 1
    @top_floor = options[:top_floor]
  end

  def install_elevator
    @elevators.push(Elevator.new({id: @elevators.count}))
  end

  def request_service(source, destination)
    # elevators can't go beyond top floor, below bottom floor, and no action for same floor
    return if destination > @top_floor || destination < @bottom_floor || source == destination
    # Finds elevator, requests
    elevator = find_some_elevator(source, destination)
    elevator.add_destination(destination)
  end

  private

  def active_elevators
    # returns list of elevators not in maintenance mode
    @elevators.select{|elevator| !elevator.maintenance_mode}
  end

  def find_some_elevator(source, destination)

  end

  def find_on_floor(floor)
    # Finds an elevator on the same floor
  end

  def find_in_flight(source, destination)
    # Finds an elevator that will be passing source
  end

  def find_nearest(source)
    # Finds nearest elevator, not in flight
  end
end