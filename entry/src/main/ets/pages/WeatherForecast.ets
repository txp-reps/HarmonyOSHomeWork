import { CurrentForecast } from '../view/CurrentForecast'
import { FutureForecast } from '../view/FutureForecast'
import { ForecastFactory as ForecastRepo, ForecastData, CurrentForecastData, Forecast3HItemList } from '../ViewModel/ForecastVM'

@Entry
@Component
struct WeatherForecast {
  forecastRepo: ForecastRepo = new ForecastRepo();
  @State loadCompleted: boolean = false;
  @State future3HList: Forecast3HItemList = null;
  @State currentForecast: CurrentForecastData = null;

  async aboutToAppear() {
    await this.forecastRepo.loadForecast(this.updateData.bind(this))
    this.loadCompleted = true;
  }

  updateData(forecastData: ForecastData) {
    this.future3HList = forecastData.future3HList
    this.currentForecast = forecastData.currentForecast
  }

  build() {
    Column({ space: 15 }) {
      if (this.loadCompleted) {
        CurrentForecast({ currentData: this.currentForecast })
        FutureForecast({ futureData: this.future3HList })
      } else {
        Text('loading')
      }
    }
    .width('100%')
  }
}