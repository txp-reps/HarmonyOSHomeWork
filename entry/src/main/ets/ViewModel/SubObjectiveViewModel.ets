export class SubObjectiveItemModel {
  constructor(public name: string,
              public progress: number,
              public updateDate: Date,
              public isComplete = false) {
  }

  equals(other: SubObjectiveItemModel): boolean {
    return this.name === other.name;
  }
}