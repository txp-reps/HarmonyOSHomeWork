import { expect } from '@ohos/hypium'
import PreferencesUtil from '../common/utils/PreferencesUtil'

export class ForecastFactory {
  async loadForecast(updateData: Function) {
    const future3H: Forecast3HItemList = {
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
        {
          temp: 26,
          icon: '10d',
          time: '18:00'
        },
        {
          temp: 27,
          icon: '10d',
          time: '18:00'
        },
        {
          temp: 28,
          icon: '10d',
          time: '18:00'
        },
        {
          temp: 29,
          icon: '10d',
          time: '18:00'
        },
      ] }

    if (!await PreferencesUtil.hasData()) {
      await PreferencesUtil.save(JSON.stringify({
        future3HList: future3H,
        currentForecast: null
      }))
    }

    var forecastData = await PreferencesUtil.get();
    updateData(JSON.parse(forecastData))
  }
}

@Observed
export class ForecastData {
  future3HList: Forecast3HItemList
  currentForecast: CurrentForecastData
}

@Observed
export class CurrentForecastData {
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