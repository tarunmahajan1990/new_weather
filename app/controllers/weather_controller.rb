# app/controllers/weather_controller.rb
class WeatherController < ApplicationController
  def index
  end

  def forecast
    api_key = Rails.application.credentials.open_weather_map[:api_key]
    service = OpenWeatherMap::Forecast.new(api_key)
    @city = params[:city]
    response = service.forecast(@city)
    @forecast = response.parsed_response['list']

    # puts "----------@forecast-----"
    # puts @forecast.inspect

    # Group the forecast data by date
    daily_forecasts = @forecast.group_by { |forecast| forecast['dt_txt'].to_date }

    @temperatures = []

    # Iterate over each daily forecast and find the highest and lowest temperatures
    daily_forecasts.each do |date, forecasts|
      # Find the highest and lowest temperatures for the day
      highest_temp = forecasts.map { |forecast| forecast['main']['temp'] }.max
      lowest_temp = forecasts.map { |forecast| forecast['main']['temp'] }.min

      # Display the results
      # puts "Date: #{date}"
      # puts "Highest temperature: #{highest_temp}"
      # puts "Lowest temperature: #{lowest_temp}"

      @temperatures.push({
        date: date,
        highest_temp: highest_temp,
        lowest_temp: lowest_temp
      })
    end



    # Build the API endpoint URL
    url = "http://api.openweathermap.org/data/2.5/weather?q=#{@city}&appid=#{api_key}&units=metric"

    # Make the API request
    response = HTTParty.get(url)

    # Check if the request was successful
    if response.code == 200
      # Parse the response JSON data
      weather_data = JSON.parse(response.body)

      # Extract the relevant weather information
      @temperature = weather_data['main']['temp']
      @weather_description = weather_data['weather'][0]['description']

      @humidity = weather_data['main']['humidity']
      @description = weather_data['weather'][0]['description']

      # Display the weather information
      puts "Current temperature in #{@city}: #{@temperature}°C"
      puts "Current weather description in #{@city}: #{@weather_description}"
    else
      # Display an error message if the request failed
      puts "Failed to get weather data for #{@city_name}. Error code: #{response.code}"
    end
    


    if @forecast.present?
      render :forecast
    else
      render :index
    end
  end
end

