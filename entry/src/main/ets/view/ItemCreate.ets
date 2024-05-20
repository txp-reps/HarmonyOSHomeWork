@Component
export struct ItemCreate {
  @State text: string = ''
  private addItem: Function = null;

  build() {
    Row({ space: 10 }) {
      TextInput({ text: this.text, placeholder: "new item" })
        .onChange((value: string) => {
          this.text = value
        })
        .layoutWeight(8)

      Button("create")
        .onClick(() => {
          this.addItem(this.text)
          this.text = ''
        })
        .layoutWeight(2)
    }
    .width("93.3%")
    .justifyContent(FlexAlign.SpaceBetween)
    .margin({
      top: 10
    })

  }
}