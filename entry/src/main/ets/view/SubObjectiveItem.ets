import { SubObjectiveItemModel } from '../ViewModel/SubObjectiveViewModel'
@Component
export struct SubObjectiveItem {
  private subObjectiveItem: SubObjectiveItemModel

  build() {
    Row() {
      Text(this.subObjectiveItem.name)
        .fontWeight(500)
        .fontSize(25)
        .padding({
          left: 15
        })

      Column(){
        Text(`${this.subObjectiveItem.progress}%`)
        Text(`更新时间:${this.subObjectiveItem.updateDate.toDateString()}`)
      }.alignItems(HorizontalAlign.End)
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .padding({
      right: 10
    })
    .borderRadius(10)
    .width('100%')
    .height(80)
    .backgroundColor(Color.White)
  }
}