class ItemRepo {
  private items: string[] = [
    "eating",
    "exercise",
    "shopping",
    "homework"
  ];

  getItems() {
    return this.items
  }

  addItem(newItem: string) {
    if (newItem === null || newItem === "") {
      return
    }

    this.items.push(newItem)
  }

  deleteItem(itemTobeDelete: string) {
    console.log(`delete item: ${itemTobeDelete}`)
    this.items = this.items.filter((item) => {
      return item !== itemTobeDelete;
    })

  }
}

export default new ItemRepo()