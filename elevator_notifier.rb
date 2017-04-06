include "event_system" # provides emit to notify any listening services

module ElevatorNotifier
  def floor_change(id, floor)
    emit("Elevator #{id}::Floor Change::#{floor}")
  end

  def door_change(id, door_state)
    emit("Elevator #{id}::Door Change::#{door_state}")
  end
end