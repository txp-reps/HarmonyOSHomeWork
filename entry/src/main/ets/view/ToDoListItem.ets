import CommonConstants from '../constant/CommonConstant';
import ItemRepo from '../ViewModel/ItemRepo';

@Component
export struct ToDoListItem {
  private itemContent: string = "";
  @State isComplete: boolean = false;
  @Link items: string[];

  build() {
    Row() {
      if (this.isComplete) {
        this.completeItem()
      } else {
        this.incompleteItem()
      }
      this.delButton()
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .borderRadius(CommonConstants.BORDER_RADIUS)
    .backgroundColor($r('app.color.start_window_background'))
    .width(CommonConstants.LIST_DEFAULT_WIDTH)
    .height($r('app.float.list_item_height'))
    .margin(10)
    .onClick(this.changeState.bind(this))
  }

  private changeState() {
    this.isComplete = !this.isComplete
  }

  @Builder
  private completeItem() {
    Row() {
      Image($r('app.media.ic_ok'))
        .objectFit(ImageFit.Contain)
        .width($r('app.float.checkbox_width'))
        .height($r('app.float.checkbox_width'))
        .margin($r('app.float.checkbox_margin'))
      Text(this.itemContent)
        .fontWeight(CommonConstants.FONT_WEIGHT)
        .fontSize($r('app.float.item_font_size'))
        .opacity(0.4)
        .decoration({ type: TextDecorationType.LineThrough })
    }
  }

  @Builder
  private delButton() {
    Button("DEL")
      .type(ButtonType.Capsule)
      .backgroundColor($r('app.color.delete_button'))
      .onClick(() => {
        ItemRepo.deleteItem(this.itemContent)
        this.items = ItemRepo.getItems()
      })
  }
  @Builder
  private incompleteItem() {
    Row() {
      Image($r('app.media.ic_default'))
        .objectFit(ImageFit.Contain)
        .width($r('app.float.checkbox_width'))
        .height($r('app.float.checkbox_width'))
        .margin($r('app.float.checkbox_margin'))
      Text(this.itemContent)
        .fontWeight(CommonConstants.FONT_WEIGHT)
        .fontSize($r('app.float.item_font_size'))
    }
  }
}