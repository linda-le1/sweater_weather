class MunchiesSerializer
    include FastJsonapi::ObjectSerializer
    set_type :munchies
    attributes :end_location, :travel_time, :forecast, :restaurant
end