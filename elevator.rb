 class Elevator
  attr_reader :current_floor, :destinations, :maintenance_mode

  def initialize(options)
    @id = options[:id]
    @current_floor = 1
    @destination = nil
    @trips = 0
    @maintenance_mode = false
  end

  def add_destination(destination)
    @destination = destination
  end

  def move_up
    @current_floor += 1
    notify_floor_change
  end

  def move_down
    @current_floor -= 1
    notify_floor_change
  end

  def notify_floor_change
    # Notifies listeners that the elevator has reached a new floor
    # Uses @id and @current_floor to provide enough context for listeners
  end

  def notify_door_status
    # Notifies listeners that the elevator's doors are opening/closing
    # Uses @id and __status__ to provide enough context for listeners
  end
 end