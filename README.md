## Weather City App
Welcome to weather city were you'll be able to get information about the weather in your current city.

## Local Setup

Clone down the repo
```
$ git clone git@github.com:abroberts5/weather_city_app.git
```

Install the gem packages
```
$ bundle
```

Set up the database
```
$ rake db:{create,migrate}
```

Run the test suite:
```
$ rspec
```

## API Setup
We need to run Figaro to create a hidden .yml file to store our API keys locally

```
$ bundle exec figaro install
```

## Within config/application.yml, add the following Environment Variable keys:

### Google’s Geocoding API
* Request Token @:
[https://developers.google.com/maps/documentation/geocoding/start](https://developers.google.com/maps/documentation/geocoding/start)

* GOOGLE_API_KEY: `your api key from google`

### DarkSky API
* Request Token @:
[https://darksky.net/dev](https://darksky.net/dev)

* DARK_SKY_API: `your api key from darksky`

## Deployment

This app is deployed on heroku at:

* [https://sweater-weather-a.herokuapp.com/](https://sweater-weather-a.herokuapp.com/)

## Technologies

* [vcr](https://github.com/vcr/vcr)
* [rails](https://rubyonrails.org/)

### Versions

* Ruby 2.4.5
* Rails 5.2.2

### Contributors

* Me   [https://github.com/jaaronbr](https://github.com/jaaronbr)

### Paths

* https://sweater-weather-a.herokuapp.com/api/v1/forecast?location=denver,co
* https://sweater-weather-a.herokuapp.com/api/v1/backgrounds?location=denver,co
* https://sweater-weather-a.herokuapp.com/api/v1/gifs?location=denver,co
* https://sweater-weather-a.herokuapp.com/api/v1/favorites
