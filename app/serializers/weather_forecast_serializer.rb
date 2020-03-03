class WeatherForecastSerializer
    include FastJsonapi::ObjectSerializer
    set_type :forecast
    attributes :id, :location_results, :current_weather_results, :current_evening_summary, :daily_forecast_results, :hourly_forecast_results
end