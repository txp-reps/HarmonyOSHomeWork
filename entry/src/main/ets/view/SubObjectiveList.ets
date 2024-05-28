import { SubObjectiveListViewModel } from '../ViewModel/ObjectiveViewModel';
import { SubObjectiveItemModel } from '../ViewModel/SubObjectiveViewModel'
import { AddSubObjectiveDialog } from './AddSubObjectiveDialog';
import { SubObjectiveItem } from './SubObjectiveItem'


@Component
export struct SubObjectiveList {
  @Link totalNum: number
  @Link completedNum: number

  @State isEditMode: boolean = false
  @State allSelected: boolean = false
  @State listModel: SubObjectiveListViewModel = new SubObjectiveListViewModel([
    new SubObjectiveItemModel("吃饭", 10, new Date()),
  ]);
  @State clickIndex: number = -1
  @State @Watch("onProgressChanged") progressChanged: boolean = false


  addItemDialogController: CustomDialogController = new CustomDialogController({
    builder: AddSubObjectiveDialog({
      onClickOk: (value: string): void => {
        this.listModel.addItem(value)
        this.updateStatus()
      }
    }),
    alignment: DialogAlignment.Bottom,
    offset: {
      dx: 0,
      dy: -16
    },
    customStyle: true,
    autoCancel: false
  });

  aboutToAppear() {
    this.updateStatus()
  };

  onProgressChanged() {
    this.updateStatus()
  }

  updateStatus() {
    this.totalNum = this.listModel.subObjectiveItemList.length;
    this.completedNum = this.listModel.countCompletedItems();
  }

  build() {
    Column() {
      Row() {
        Text('子目标')
          .fontSize(30)
          .fontWeight(600)
          .padding({
            top: 10,
            bottom: 20
          })

        if (this.isEditMode) {
          Row() {
            Button('取消')
              .backgroundColor(Color.Transparent)
              .fontColor('#007DFF')
              .padding(0)
              .onClick(_ => {
                this.isEditMode = false;
                this.setAllItemEditMode()
              })


            Button('全选')
              .backgroundColor(Color.Transparent)
              .fontColor('#007DFF')
              .padding(0)
              .margin({
                left: 10
              })

            Checkbox()
              .select(this.allSelected)
              .onClick(_ => {
                this.allSelected = !this.allSelected
                this.setAllSubObjectiveItemSelected()
              })
          }

        } else {
          Button('编辑')
            .backgroundColor(Color.Transparent)
            .fontColor('#007DFF')
            .onClick(_ => {
              this.isEditMode = true
              this.setAllItemEditMode()
            })
        }
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      List({ space: 10 }) {
        ForEach(this.listModel.subObjectiveItemList, (item: SubObjectiveItemModel, index: number) => {
          ListItem() {
            SubObjectiveItem({
              subObjectiveItem: item,
              index: index,
              clickIndex: $clickIndex,
              progressChanged: $progressChanged
            })
          }
        }, (item: SubObjectiveItemModel) => JSON.stringify(item))
      }
      .edgeEffect(EdgeEffect.None)
      .width('100%')
      .height('70%')

      if (this.isEditMode) {
        Button("删除")
          .alignSelf(ItemAlign.Center)
          .layoutWeight(1)
          .width(156)
          .fontSize(16)
          .fontWeight(600)
          .fontColor(Color.Red)
          .backgroundColor('#0D182431')
          .margin({
            top: 10
          })
          .onClick(_ => {
            this.listModel.deleteItem()
            this.updateStatus()
          })


      } else {
        Button("添加子目标")
          .alignSelf(ItemAlign.Center)
          .layoutWeight(1)
          .width(156)
          .fontSize(16)
          .fontWeight(600)
          .fontColor('#007DFF')
          .backgroundColor('#0D182431')
          .margin({
            top: 10
          })
          .onClick(_ => {
            this.addItemDialogController.open();
          })
      }

    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Start)
  }

  private setAllSubObjectiveItemSelected() {
    this.listModel.subObjectiveItemList.forEach(item => {
      item.isSelected = this.allSelected;
    })
  }

  private setAllItemEditMode() {
    this.listModel.subObjectiveItemList.forEach(item => {
      item.isEditMode = this.isEditMode;
    })
  }
}

