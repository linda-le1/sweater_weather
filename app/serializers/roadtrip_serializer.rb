class RoadtripSerializer
    include FastJsonapi::ObjectSerializer
    attributes :id, :origin, :destination, :travel_time, :arrival_forecast
end