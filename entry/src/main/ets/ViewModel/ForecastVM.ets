import { httpRequestGet } from '../common/utils/HttpUtil'
import PreferencesUtil from '../common/utils/PreferencesUtil'

var testData = {
  future3HList: {
    list: [
      {
        temp: 20,
        icon: '10d',
        time: '15:00'
      },
      {
        temp: 25,
        icon: '10d',
        time: '18:00'
      },
    ] },
  currentForecast: {
    currentTemp: 25,
    icon: '10n',
    maxTempInFuture: 18,
    minTempInFuture: 33,
    weatherDesc: '多云',
    SomaTemp: 23
  }
}


export class ForecastFactory {
  async loadForecast(updateData: Function) {

    if (!await PreferencesUtil.hasData()) {
      var weatherData = await this.loadRemoteData(updateData)
      await PreferencesUtil.save(JSON.stringify(weatherData))
    }

    var forecastData = await PreferencesUtil.get();
    updateData(JSON.parse(forecastData))
  }

  private async loadRemoteData(updateData: Function): Promise<ForecastData> {
    var futureForecastUrl = 'https://api.openweathermap.org/data/2.5/forecast?appid=7ce48fbdedcc72653e589f93b4da7ee4&units=metric&lang=zh_cn&q=Chengdu,CN';
    var currentForecastUrl = 'https://api.openweathermap.org/data/2.5/weather?lat=30.6598628&lon=104.0633717&units=metric&lang=zh_cn&appid=7ce48fbdedcc72653e589f93b4da7ee4';
    var currentForecastResponse: CurrentForecastResponse = await httpRequestGet<CurrentForecastResponse>(currentForecastUrl)
    var futureForecastResponse: FutureForecastResponse = await httpRequestGet<FutureForecastResponse>(futureForecastUrl)

    var weatherData = {
      currentForecast: {
        currentTemp: currentForecastResponse.main.temp,
        icon: currentForecastResponse.weather[0].icon,
        maxTempInFuture: currentForecastResponse.main.temp_max,
        minTempInFuture: currentForecastResponse.main.temp_min,
        weatherDesc: currentForecastResponse.weather[0].description,
        SomaTemp: currentForecastResponse.main.feels_like
      },
      future3HList: {
        list: futureForecastResponse.list.map((item) => {
          return {
            temp: item.main.temp,
            icon: item.weather[0].icon,
            time: convertTimestampToTime(item.dt_txt)
          }
        })
      },
    }

    updateData(weatherData, true)
    return weatherData;
  }
}

@Observed
export class ForecastData {
  future3HList: Forecast3HItemList
  currentForecast: CurrentForecastData
}

@Observed
export class CurrentForecastData {
  currentTemp: number
  icon: string
  maxTempInFuture: number
  minTempInFuture: number
  weatherDesc: string
  SomaTemp: number
}

@Observed
export class Forecast3HItemList {
  public list: Forecast3HItem[]
}

@Observed
export class Forecast3HItem {
  public temp: number
  public icon: string
  public time: string
}

export interface CurrentForecastResponse {
  weather: [
    {
      description: '多云',
      icon: '03d'
    }
  ],
  main: {
    temp: 27.94,
    feels_like: 28.47,
    temp_min: 27.94,
    temp_max: 27.94,
  },
  cod: 200
}

export interface FutureForecastResponse {
  list: [
    {
      main: {
        temp: 26.89,
      },
      weather: [
        {
          icon: '04d'
        }
      ],
      dt_txt: '2024-06-05 12:00:00'
    },
  ],
}

function convertTimestampToTime(timestamp: string): string {
  const parts = timestamp.split(' ');

  if (parts.length !== 2) {
    throw new Error("Invalid timestamp format");
  }

  const timePart = parts[1];

  const timeParts = timePart.split(':');

  if (timeParts.length < 2) {
    throw new Error("Invalid time format");
  }

  const hours = timeParts[0];
  const minutes = timeParts[1];

  return `${hours}:${minutes}`;
}
