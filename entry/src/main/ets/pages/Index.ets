import CommonConstants from '../constant/CommonConstant';
import { ItemCreate } from '../view/ItemCreate';
import { ToDoListItem } from '../view/ToDoListItem'
import ItemRepo from '../ViewModel/ItemRepo';

@Entry
@Component
struct Index {
  @State items: string[] = ItemRepo.getItems();

  build() {
    Column() {
      Text("代办事项")
        .fontSize($r('app.float.title_font_size'))
        .fontWeight(FontWeight.Bold)
        .lineHeight($r('app.float.title_font_height'))
        .width(CommonConstants.TITLE_WIDTH)
        .margin({
          top: $r('app.float.title_margin_top'),
          bottom: $r('app.float.title_margin_bottom')
        })
        .textAlign(TextAlign.Start)

      ForEach(this.items, (item: string, _: number) => {
        ToDoListItem({ itemContent: item ,items: $items})
      })
      ItemCreate({ items: $items })
    }.width(CommonConstants.FULL_LENGTH)
    .height(CommonConstants.FULL_LENGTH)
    .backgroundColor($r('app.color.page_background'))

  }
}