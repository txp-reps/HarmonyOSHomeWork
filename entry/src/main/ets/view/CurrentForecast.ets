import { CurrentForecastData } from '../ViewModel/ForecastVM';

@Component
export struct CurrentForecast {
  @ObjectLink currentData: CurrentForecastData;

  build() {
    Row() {
      Column() {
        Row() {
          Text(`${this.currentData.currentTemp}\u2103`)
            .fontSize(35)
            .fontWeight(600)
          Image(`https://openweathermap.org/img/wn/${this.currentData.icon}.png`)
            .objectFit(ImageFit.Contain)
            .width(60)
        }.margin(
          {
            top: 20
          }
        )

        Row() {
          Text(`未来24小时: ${this.currentData.minTempInFuture}\u2103/${this.currentData.maxTempInFuture}\u2103`)
        }
      }
      .alignItems(HorizontalAlign.Start)
      .width('60%')

      Column() {
        Text(`${this.currentData.weatherDesc}`)
        Text(`体感温度：${this.currentData.SomaTemp}\u2103`)
      }.alignItems(HorizontalAlign.End)
      .width('40%')

    }
    .width('100%')
    .height('30%')
    .padding(20)
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundImage($r('app.media.weather_background'))
    .backgroundImageSize(ImageSize.Cover)

  }
}