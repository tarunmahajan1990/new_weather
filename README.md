# New Weather

New Weather is a simple Ruby on Rails application that shows the 7-day weather forecast for a given city using the OpenWeatherMap API. This README will guide you through setting up the application and adding a new feature to retrieve the current conditions for the city.

## Prerequisites

- Ruby 2.6.3 or higher
- Rails 6.0.0 or higher

## Setup

1. Fork the repository by clicking the "Fork" button at the top-right corner of the repository page on GitHub.

2. Clone your forked repository:

`$ git clone https://github.com/yourusername/WeatherApp.git`

3. Change into the app directory:

`$ cd new_weather`

4. Install the required gems:

`$ bundle install`

5. Create an API key from OpenWeatherMap:

- Sign up for a free account at [https://home.openweathermap.org/users/sign_up](https://home.openweathermap.org/users/sign_up).
- After signing in, go to the [API keys section](https://home.openweathermap.org/api_keys) and create a new API key.

6. Add your OpenWeatherMap API key to `config/credentials.yml.enc`:

`$ EDITOR="your_editor" rails credentials:edit`

Add the following content and replace `YOUR_API_KEY` with your API key:

```yml
open_weather_map:
  api_key: YOUR_API_KEY
```

7. Start the Rails server:

`$ rails server`

8. Open your browser and go to http://localhost:3000 to view the app.

## Task: Add Current Conditions Feature

Your task is to add a new feature to the app that retrieves and displays the current weather conditions for the city the user submits.

### Requirements

- Only display the highest and lowest values for each day of the existing forecast. We do not want hourly entries.
- Retrieve the current weather conditions for the submitted city using the OpenWeatherMap API.
- Display the current temperature, humidity, and a brief weather description.
- Update the UI to show the current conditions in a visually appealing manner.


## Submission Process

1. Commit your changes to a new branch:

```bash
git checkout -b your_feature_branch
git add .
git commit -m "Add current conditions feature"
```

2. Push your changes to your forked repository:

```bash
git push origin your_feature_branch
```

3. Create a tar.gz archive of the project folder, excluding any unnecessary files (e.g., .git, node_modules, etc.):

```bash
tar -czvf WeatherApp.tar.gz WeatherApp --exclude=.git --exclude=node_modules
```

4. Send the zip file as an email attachment to [codesubmissions@itsacheckmate.com](mailto:codesubmissions@itsacheckmate.com) with the subject line "WeatherApp Code Submission - Your Full Name". Replace "Your Full Name" with your actual full name.

We'll review your submission and get back to you with feedback. Good luck!
