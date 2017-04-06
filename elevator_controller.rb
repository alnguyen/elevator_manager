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
    elevator = elevator_on_floor(source) || elevator_passing(source, destination) || elevator_nearest(source)
    elevator.add_destination(destination) unless elevator.nil?
  end

  private

  def elevator_on_floor(floor)
    @elevators.select{|elevator| !elevator.maintenance_mode && elevator.current_floor == source && motion_direction.nil?}.first
  end

  def elevator_passing(source, destination)
    if source > destination
      # Going down
      @elevators.select{|elevator| !elevator.maintenance_mode && elevator.current_floor > source && elevator.motion_direction == "down"}.first
    else
      # Going up
      @elevators.select{|elevator| !elevator.maintenance_mode && elevator.current_floor < source && elevator.motion_direction == "up"}.first
    end
  end

  def elevator_nearest(source)
    # TODO: Seems highly inefficient, iterating so often.  There's gotta be a better way
    stopped_elevators = @elevators.select{|elevator| !elevator.maintenance_mode && elevator.destinations.empty?}.sort{|elevator| elevator.current_floor}
    stopped_floors = stopped_elevators.map{|elevator| elevator.current_floor}.min_by{ |floor| (floor - source).abs }
    nearest = stopped_floors.min_by{ |floor| (floor - source).abs }
    stopped_elevators.select{|elevator| elevator.current_floor == nearest}.first
  end
end