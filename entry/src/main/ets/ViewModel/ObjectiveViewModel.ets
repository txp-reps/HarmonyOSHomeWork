import { SubObjectiveItemModel } from './SubObjectiveViewModel'

@Observed
export class ObjectiveViewModel {
  constructor(public subObjectiveItemList?: SubObjectiveItemModel[]) {
  }

  addItem(newItem: SubObjectiveItemModel) {
    if (newItem === null) {
      return
    }

    console.log(`add item: ${newItem}`)
    this.subObjectiveItemList.push(newItem)
  }

  deleteItem(itemTobeDelete: SubObjectiveItemModel) {
    console.log(`delete item: ${itemTobeDelete}`)
    this.subObjectiveItemList = this.subObjectiveItemList.filter((item) => {
      return !item.equals(itemTobeDelete);
    })
  }

  countCompletedItems() {
    return this.subObjectiveItemList.filter(item => {
      return item.isComplete
    }).length
  }
}