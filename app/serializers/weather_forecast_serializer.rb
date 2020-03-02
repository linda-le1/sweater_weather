class WeatherForecastSerializer
    include FastJsonapi::ObjectSerializer
    attributes :id, :current_weather_results, :daily_forecast_results, :hourly_forecast_results
end