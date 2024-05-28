import { ObjectiveSummary } from '../view/ObjectiveSummary'
import { SubObjectiveList } from '../view/SubObjectiveList'

@Entry
@Component
struct Objective {
  @State totalNum: number = 0;
  @State completedNum: number = 0;

  build() {
    Column({ space: 10 }) {
      this.ObjectiveTitle()

      ObjectiveSummary({
        totalNumber: this.totalNum,
        completedNumber: this.completedNum,
        updateDate: new Date().toTimeString()
      })
        .height('30%')

      SubObjectiveList({ totalNum: $totalNum, completedNum: $completedNum })
        .height('60%')
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