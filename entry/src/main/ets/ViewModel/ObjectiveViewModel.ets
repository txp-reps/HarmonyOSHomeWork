import { SubObjectiveItemModel } from './SubObjectiveViewModel'

@Observed
export class SubObjectiveListViewModel {
  refresh = false
  public subObjectiveItemList?: SubObjectiveItemModel[]

  constructor(subObjectiveItemList?: SubObjectiveItemModel[]) {
    this.subObjectiveItemList = subObjectiveItemList
  }

  addItem(newItem: string) {
    if (newItem === null || newItem === '') {
      return
    }

    console.log(`add item: ${newItem}`)
    this.subObjectiveItemList.push(new SubObjectiveItemModel(newItem))
    this.triggerRefresh()
  }

  triggerRefresh() {
    this.refresh = !this.refresh
  }

  deleteItem() {
    console.log(`delete selected items`)
    this.subObjectiveItemList = this.subObjectiveItemList.filter((item) => {
      return !item.isSelected;
    })
    console.log(this.subObjectiveItemList.length.toString())
  }

  countCompletedItems() {
    return this.subObjectiveItemList.filter(item => {
      return item.isComplete
    }).length
  }
}