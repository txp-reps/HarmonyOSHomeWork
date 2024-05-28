import { SubObjectiveItemModel } from '../ViewModel/SubObjectiveViewModel'

@Component
export struct SubObjectiveItem {
  @ObjectLink private subObjectiveItem: SubObjectiveItemModel
  @Link @Watch("onClickIndexChange") clickIndex: number
  @Link progressChanged: boolean
  public index: number = 0

  onClickIndexChange() {
    if (this.clickIndex === this.index) {
      this.subObjectiveItem.isExpanded = true
      return
    }

    this.subObjectiveItem.isExpanded = false
  }

  build() {
    Column() {
      Row() {
        Text(this.subObjectiveItem.name)
          .fontWeight(500)
          .fontSize(20)
          .padding({
            left: 15
          })

        Column() {
          Text(`${this.subObjectiveItem.progress}%`)
          Text(`更新时间:${this.subObjectiveItem.updateDate.toDateString()}`)
        }.alignItems(HorizontalAlign.End)

        if (this.subObjectiveItem.isEditMode) {
          Checkbox()
            .select(this.subObjectiveItem.isSelected)
            .onChange(v => {
              this.subObjectiveItem.isSelected = v
            })
        }
      }
      .onClick(_ => {
        this.clickIndex = this.index
      })
      .justifyContent(FlexAlign.SpaceBetween)
      .padding({
        right: 10
      })
      .width('100%')
      .height(80)

      if (this.subObjectiveItem.isExpanded) {
        Row() {
          Button("取消")
            .backgroundColor(Color.Transparent)
            .fontColor('#007DFF')
            .padding(0)
            .onClick(_ => {
              this.clickIndex = -1
            })

          Button("完成")
            .backgroundColor(Color.Transparent)
            .fontColor('#007DFF')
            .padding(0)
            .onClick(_ => {
              this.subObjectiveItem.isComplete = true;
              this.clickIndex = -1
              this.progressChanged = !this.progressChanged
            })
        }
        .width('70%')
        .justifyContent(FlexAlign.SpaceBetween)
      }

    }
    .borderRadius(10)
    .width('100%')
    .backgroundColor(Color.White)
  }
}