import CommonConstants from '../common/constant/CommonConstant';
import { ItemCreate } from '../view/ItemCreate';
import { ToDoListItem } from '../view/ToDoListItem'
import { ItemModel } from '../ViewModel/ItemViewModel';

@Entry
@Component
struct Index {
  @State itemModel: ItemModel = new ItemModel(
    ["eating",
      "exercise",
      "shopping",
      "homework"]);

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

      ForEach(this.itemModel.getItems(), (item: string, _: number) => {
        ToDoListItem({ itemContent: item, delItem: this.delItem.bind(this) })
      })
      ItemCreate({ addItem: this.addItem.bind(this) })
    }.width(CommonConstants.FULL_LENGTH)
    .height(CommonConstants.FULL_LENGTH)
    .backgroundColor($r('app.color.page_background'))
  }

  private delItem(itemToBeDeleted: string) {
    this.itemModel.deleteItem(itemToBeDeleted)
  }

  private addItem(itemToBeAdded: string) {
    this.itemModel.addItem(itemToBeAdded)
  }
}