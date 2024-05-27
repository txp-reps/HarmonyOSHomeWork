import { SubObjectiveItemModel } from '../ViewModel/SubObjectiveViewModel'
import { SubObjectiveItem } from './SubObjectiveItem'

@Component
export struct SubObjectiveList {
  private itemList: SubObjectiveItemModel[];

  build() {
    Column() {
      Text('子目标')
        .fontSize(35)
        .fontWeight(600)
        .padding({
          top: 10,
          bottom: 20
        })

      List({ space: 10 }) {
        ForEach(this.itemList, (item: SubObjectiveItemModel) => {
          ListItem() {
            SubObjectiveItem({ subObjectiveItem: item })
          }
        }, (item: SubObjectiveItemModel) => JSON.stringify(item))
      }
      .width('100%')
      .layoutWeight(7)

      Blank()
      Blank()

      Button("添加子目标")
        .alignSelf(ItemAlign.Center)
        .layoutWeight(1)
        .width(156)
        .fontSize(16)
        .fontWeight(600)
        .fontColor('#007DFF')
        .backgroundColor('#0D182431')

    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Start)

  }
}