import { Forecast3HItem, Forecast3HItemList } from '../ViewModel/ForecastVM';

@Component
export struct FutureForecast {
  @ObjectLink futureData: Forecast3HItemList;

  build() {
    Column() {
      Text('三小时天气预报')
        .fontWeight(500)
        .fontSize(20)
        .padding(10)

      Row() {

        List({ space: 10 }) {
          ForEach(this.futureData.list, (item: Forecast3HItem) => {
            ListItem() {
              Column() {
                Text(item.temp + '\u2103')
                Image(`https://openweathermap.org/img/wn/${item.icon}.png`)
                  .objectFit(ImageFit.Contain)
                  .width(30)
                Text(item.time)
              }
              .width('20%')
              .justifyContent(FlexAlign.Start)

            }
          }, (item: Forecast3HItem) => JSON.stringify(item))
        }
        .backgroundColor(Color.Green)
        .listDirection(Axis.Horizontal)
        .width('100%')
        .height(70)
        .scrollBar(BarState.Auto)
      }
    }
    .margin({
      top: 20
    })
    .backgroundColor(Color.Gray)
    .width('100%')
    .height('70%')
    .alignItems(HorizontalAlign.Start)

  }
}