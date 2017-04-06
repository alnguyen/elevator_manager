class ElevatorController
  def initialize(options)
    @elevators = []
    @bottom_floor = options[:bottom_floor] || 1
    @top_floor = options[:top_floor]
  end
end