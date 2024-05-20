export class ItemModel {
  refreshFlag:boolean = false;
  constructor(public items: string[]) {
  }

  getItems() {
    return this.items
  }

  addItem(newItem: string) {
    if (newItem === null || newItem === "") {
      return
    }

    console.log(`add item: ${newItem}`)
    this.items.push(newItem)
    this.refreshFlag = !this.refreshFlag
  }

  deleteItem(itemTobeDelete: string) {
    console.log(`delete item: ${itemTobeDelete}`)
    this.items = this.items.filter((item) => {
      return item !== itemTobeDelete;
    })

  }
}