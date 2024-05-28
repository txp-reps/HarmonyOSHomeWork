@CustomDialog
export struct AddSubObjectiveDialog {
  private onClickOk: Function;
  private controller?: CustomDialogController;
  @State private subObjectiveName: string = '';

  build() {
    Column() {
      Text('添加子目标')
        .width('100%')
        .fontSize(20)
        .fontWeight(500)
        .textAlign(TextAlign.Start)

      TextInput({ placeholder: '请输入子目标名称' })
        .width('100%')
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 16 })
        .caretColor(Color.Blue)
        .backgroundColor("#0D182431")
        .height('30%')
        .margin({ top: '6%' })
        .fontSize(16)
        .fontColor('#182431')
        .onChange(value => {
          this.subObjectiveName = value
        })
      Blank()
      Row() {
        Button('取消')
          .dialogButtonStyle()
          .onClick(_ => {
            this.controller.close()
          })

        Divider()
          .vertical(true)

        Button('确定')
          .dialogButtonStyle()
          .onClick(_ => {
            if (this.onClickOk !== undefined) {
              this.onClickOk(this.subObjectiveName)
            }
            this.controller.close()
          })
      }
      .height('10%')
      .width('70%')
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .padding(24)
    .height(168)
    .width('90%')
    .borderRadius(10)
    .backgroundColor(Color.White)

  }
}

@Extend(Button) function dialogButtonStyle() {
  .fontSize(16)
  .height(32)
  .width(96)
  .backgroundColor(Color.White)
  .fontColor('#007DFF')
}
