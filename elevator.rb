 class Elevator
  attr_reader :current_floor, :destinations, :maintenance_mode, :motion_direction

  def initialize(options)
    @id = options[:id]
    @current_floor = 1
    @destinations = []
    @motion_direction = nil # Probably don't need to specify this
    @trips = 0
    @maintenance_mode = false
  end

  def run
    while @destinations.length > 0 do
      @motion_direction == :up ? move_up : move_down
      if @destinations.include?(current_floor)
        notify_door_change("open")
        notify_door_change("close")
        @destinations.keep_if{|destination| destination != current_floor}
      end
    end

    @trips += 1
    @maintenance_mode = @trips == 100
  end

  def add_destination(destination)
    @destinations.push(destination)
    @motion_direction = destination > current_floor ? :up : :down
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
    # Notifies that the elevator has reached a new floor
    # Uses @id and @current_floor to provide enough context for listeners
  end

  def notify_door_status
    # Notifies that the elevator's doors are opening/closing
    # Uses @id and __status__ to provide enough context for listeners
  end
 end