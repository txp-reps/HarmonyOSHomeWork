import { ObjectiveSummary } from '../view/ObjectiveSummary'
import { SubObjectiveList } from '../view/SubObjectiveList'
import { ObjectiveViewModel } from '../ViewModel/ObjectiveViewModel'
import { SubObjectiveItemModel } from '../ViewModel/SubObjectiveViewModel';

@Entry
@Component
struct Objective {
  @State viewModel: ObjectiveViewModel = new ObjectiveViewModel([
    new SubObjectiveItemModel("吃饭", 10, new Date()),
    new SubObjectiveItemModel("喝水", 20, new Date()),
    new SubObjectiveItemModel("睡觉", 30, new Date()),
  ]);
  ;

  build() {
    Column({ space: 10 }) {
      this.ObjectiveTitle()

      ObjectiveSummary({
        totalNumber: this.viewModel.subObjectiveItemList.length,
        completedNumber: this.viewModel.countCompletedItems(),
        updateDate: new Date().toDateString()
      })
        .layoutWeight(3)

      SubObjectiveList({ itemList: this.viewModel.subObjectiveItemList })
        .layoutWeight(5)
    }
    .backgroundColor('#F1F3F5')
    .alignItems(HorizontalAlign.Start)
    .width('100%')
    .height('100%')
    .padding(20)

  }

  @Builder
  private ObjectiveTitle() {
    Text('工作目标')
      .fontSize(45)
      .fontWeight(800)
  }
}