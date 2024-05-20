import { SubObjectiveItem } from '../view/SubObjectiveItem'
import { SubObjectiveItemModel } from '../ViewModel/SubObjectiveViewModel'

@Entry
@Component
struct Objective {
  build() {
    Column({ space: 10 }) {
      Text('工作目标')
        .fontSize(45)
        .fontWeight(800)

      Column() {
        Row() {
          Image($r('app.media.icon'))
            .objectFit(ImageFit.Contain)
            .width(100)
            .height(100)
            .alignSelf(ItemAlign.Start);

          Column() {
            Text('第一季度运营目标')
              .fontSize(25)
              .fontWeight(600)
            Text('实现用户量与活跃度提升')
          }
          .alignItems(HorizontalAlign.End)
        }
        .padding(10)
        .justifyContent(FlexAlign.SpaceBetween)
        .width('100%')
        .height('50%')

        Row() {
          Column() {
            Text("整体进度")
            Text("更新时间:")
            Text(new Date().toDateString())
          }
          .alignItems(HorizontalAlign.Start)

          Button() {
            Row() {
              Text("1").fontColor('#007DFF')
              Text("/1")
            }
          }
          .type(ButtonType.Circle)
          .backgroundColor(Color.Transparent)
          .borderWidth(1)
          .width(60)
          .height(60)
        }
        .padding(10)
        .justifyContent(FlexAlign.SpaceBetween)
        .alignItems(VerticalAlign.Bottom)
        .width('100%')
        .height('50%')
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .height('30%')
      .borderRadius(20)
      .backgroundColor(Color.White)

      Text('子目标')
        .fontSize(35)
        .fontWeight(600)

      List({ space: 10 }) {
        ForEach(SubObjectiveItemModel.defaultSubObjectiveData, (item: SubObjectiveItemModel) => {
          ListItem() {
            SubObjectiveItem({ subObjectiveItem: item })
          }
        }, (item: SubObjectiveItemModel) => JSON.stringify(item))
      }
      .width('100%')
      .height('50%')
    }
    .backgroundColor('#F1F3F5')
    .alignItems(HorizontalAlign.Start)
    .width('100%')
    .height('100%')
    .padding(20)

  }
}