
@Observed
export class SubObjectiveItemModel {
  constructor(public name: string,
              public progress: number = 0,
              public updateDate: Date = new Date(),
              public isComplete = false,
              public isEditMode = false,
              public isExpanded = false,
              public isSelected = false,
  ) {
  }

  equals(other: SubObjectiveItemModel): boolean {
    return this.name === other.name;
  }
}