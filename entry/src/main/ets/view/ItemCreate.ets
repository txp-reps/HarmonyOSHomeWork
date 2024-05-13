import ItemRepo from '../ViewModel/ItemRepo'

@Component
export struct ItemCreate {
  @State text: string = ''
  @Link items: string[];

  build() {
    Row() {
      TextInput({ text: this.text, placeholder: "new item" })
        .onChange((value: string) => {
          this.text = value
        })
        .width("80%")

      Button("create")
        .onClick(() => {
          ItemRepo.addItem(this.text.trim())
          this.items = ItemRepo.getItems()
          this.text = ''
        })
        .width("20%")
    }
    .width("93.3%")
    .justifyContent(FlexAlign.SpaceBetween)
    .margin({
      top: 10
    })

  }
}