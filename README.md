# weather-app

This is a project to create a simple weather app for iOS

## 🚨 Important note 🚨

This project is using cocoapods but a gitignore file is there so the third-party libraries are not part of the repo. Please be sure to run the **pod install** command before running the project.

If you have any doubt about cocoapods you can check the reference [here](https://cocoapods.org).

## Project Architecture 
![alt tag](https://github.com/rcasanovan/weather-app/blob/master/Images/projectArchitecture.jpeg?raw=true)

References:
* [Viper architecture](https://www.objc.io/issues/13-architecture/viper/)
* [Viper for iOS](https://medium.com/@smalam119/viper-design-pattern-for-ios-application-development-7a9703902af6)

## How did I implement VIPER?

Basically I have a protocol file for each scene in the app. This file defines the interaction between each layer as following:

* View - Presenter: protocols to notify changes and to inject information to the UI.
* Presenter - Interactor: protocols to request / receive information to / from the interator.
* Presenter - Router: protocol to define the transitions between scenes.

Whith this protocols file is really easy to know how each layer notify / request / information to the other ones so we don't have any other way to communicate all the layers.

Another important point is because I'm using protocols it's really easy to define mocks views / presenters / interactors / routers for testing.

```swift
// View / Presenter
protocol TodayViewInjection : class {
    func loadWeatherInformationWithViewModel(_ viewModel: TodayViewModel)
}

protocol TodayPresenterDelegate : class {
    func viewDidLoad()
}

// Presenter / Interactor
typealias getWeatherInteractorCompletionBlock = (_ viewModel: TodayViewModel?, _ success: Bool, _ error: ResultError?) -> Void

protocol TodayInteractorDelegate : class {
    func requestLocationAuthorizationIfNeeded()
    func getCurrentWeather(completion: @escaping getWeatherInteractorCompletionBlock)
    func getLocalWeatherInformation() -> TodayViewModel?
    func shouldGetLocalWeatherInformation() -> Bool
}
```

## First at all. Where is the data came from?

I'm using the api from **open weather map** (you can check the api documentation [here](http://openweathermap.org/api)).

You just need to create an account to have access to the api. Once you do it you'll able to get information for movies in a JSON format like this:

```json
{
    "cod": "200",
    "message": 0.178,
    "cnt": 40,
    "list": [
        {
            "dt": 1543687200,
            "main": {
                "temp": 8.52,
                "temp_min": 8.17,
                "temp_max": 8.52,
                "pressure": 992.89,
                "sea_level": 1034.86,
                "grnd_level": 992.89,
                "humidity": 72,
                "temp_kf": 0.35
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 0.96,
                "deg": 244.502
            },
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2018-12-01 18:00:00"
        },
        ...
    ],
    "city": {
    	"id": 2509954,
        "name": "Valencia",
        "coord": {
            "lat": 39.4697,
            "lon": -0.3774
        },
        "country": "ES",
        "population": 814208
    }
}
```

This is an example of the api call:
http://api.openweathermap.org/data/2.5/forecast?lat=50.075539&lon=14.4378&APPID=28bc6d7ace6e643065fd95756fae8b9c&units=imperial&lang=en

## Data models

### Network data models

These includes the following models:

```swift
public struct WeatherResponse: Codable {
    let cod: String
    let message: CGFloat
    let cnt: UInt
    let list: [WeatherListResponse]
    let city: WeatherCityResponse
}

public struct WeatherListResponse: Codable {
    let dt: Double
    let main: WeatherListMainResponse
    let weather: [WeatherListWeatherResponse]
    let wind: WeatherListWindResponse
    let rain: WeatherRainResponse?
}

public struct WeatherRainResponse: Codable {
    let rain3h: CGFloat?
    
    //__ This is little trick.
    //__ The "rain" field has another field inside called "3h"
    //__ The problem is we can't process this field using Swift
    //__ so we need to create an enum like a "bridge" to process the field
    enum CodingKeys: String, CodingKey {
        case rain3h = "3h"
    }
}

public struct WeatherListMainResponse: Codable {
    let temp: CGFloat
    let temp_min: CGFloat
    let temp_max: CGFloat
    let pressure: CGFloat
    let sea_level: CGFloat
    let grnd_level: CGFloat
    let humidity: Int
    let temp_kf: CGFloat
}

public struct WeatherListWeatherResponse: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

public struct WeatherListWindResponse: Codable {
    let speed: CGFloat
    let deg: CGFloat
}

public struct WeatherCityResponse: Codable {
    let id: Int64
    let name: String
    let coord: WeatherCityCoordResponse
    let country: String
    let population: Int64?
}

public struct WeatherCityCoordResponse: Codable {
    let lat: CGFloat
    let lon: CGFloat
}
```

I'm using a Swift Standard Library decodable functionality in order to manage a type that can decode itself from an external representation (I really ❤ this from Swift).

**Why some properties are optionals?**

**Are more properties there??**

Obviously the response has more properties for each movie. I decided to use only these ones.

Reference: [Apple documentation](https://developer.apple.com/documentation/swift/swift_standard_library/encoding_decoding_and_serialization)


### Local weather data model

This model is used for save the last weather information locally

```swift
class LocalWeather: Object {
    @objc dynamic var weatherId: String?
    @objc dynamic var weatherData: Data? = nil
    
    override class func primaryKey() -> String? {
        return "weatherId"
    }
}
```

As I'm using Realm for this it's important to define a class to manage each model in the database. In this case we only have one model (IMSearchSuggestion)

Reference: [Realm](https://realm.io/docs/swift/latest)

## Managers

I think using managers is a good idea but be careful!. Please don't create managers as if the world were going to end tomorrow.

I'm using only 4 here:

### RemoteDabaBaseManager

Used to store information remotely (Firebase)

### LocationManager

Used to manage all the location stuff (request auth, get the current location)

### ReachabilityManager

Used to manage the reachability

### LocalWeatherManager

Used to store the last weather information locally (Realm)

## How it looks like?

### Today weather & Forecast
![alt tag](https://github.com/rcasanovan/weather-app/blob/master/Images/01.png?raw=true)
![alt tag](https://github.com/rcasanovan/weather-app/blob/master/Images/02.png?raw=true)

### No internet connection
![alt tag](https://github.com/rcasanovan/weather-app/blob/master/Images/03.png?raw=true)

## What's left in the demo?

* Location permission denied: The logic to manage if the user deny the location permission is not defined. Maybe I could show a message to the user in this case.
* Realm migration process: It would be nice to add a process to migrate the realm database to a new model (just in case you need to add a new field into the database)

## Programming languages && Development tools

* Swift 4.2
* Xcode 10.1
* [Cocoapods](https://cocoapods.org) 1.5.3
* Minimun iOS version: 11.0

## Third-Party Libraries

* [RealmSwift](https://github.com/realm/realm-cocoa) (3.7.6): A mobile database that runs directly inside phones, tablets or wearables.
* [ReachabilitySwift](https://github.com/ashleymills/Reachability.swift) (4.2.1): Replacement for Apple's Reachability re-written in Swift with callbacks.
* [CollectionViewCenteredFlowLayout](https://github.com/Coeur/CollectionViewCenteredFlowLayout) (1.0.1): A layout for UICollectionView that aligns the cells to the center.
* [Firebase](https://firebase.google.com): A Backend as aService —BaaS—.

## Support && contact

### Email

You can contact me using my email: ricardo.casanova@outlook.com

### Twitter

Follow me [@rcasanovan](http://twitter.com/rcasanovan) on twitter.