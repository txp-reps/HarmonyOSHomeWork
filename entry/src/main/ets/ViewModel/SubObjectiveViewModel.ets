export class SubObjectiveItemModel {
  constructor(public name: string,
              public progress: number,
              public updateDate: Date) {
  }

  static get defaultSubObjectiveData() {
    return [
      new SubObjectiveItemModel("吃饭", 10, new Date()),
      new SubObjectiveItemModel("喝水", 20, new Date()),
      new SubObjectiveItemModel("睡觉", 30, new Date()),
    ]
  }
}