@Component
export struct ObjectiveSummary {
  @Prop private totalNumber: number;
  @Prop private completedNumber: number;
  @Prop private updateDate: string;

  build() {
    Column() {
      Row() {
        Image($r('app.media.icon'))
          .objectFit(ImageFit.Contain)
          .width(100)
          .height(100)
          .alignSelf(ItemAlign.Start);

        Column() {
          Text('第一季度运营目标')
            .fontSize(25)
            .fontWeight(600)
          Text('实现用户量与活跃度提升')
        }
        .alignItems(HorizontalAlign.End)
      }
      .padding(10)
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .height('50%')

      Row() {
        Column() {
          Text("整体进度").fontWeight(600)
          Text("更新时间:")
            .opacity(0.6)
            .fontSize(15)
          Text(this.updateDate)
        }
        .alignItems(HorizontalAlign.Start)

        Stack() {
          Row() {
            Text(this.completedNumber.toString()).fontColor('#007DFF')
            Text("/" + this.totalNumber.toString())
          }

          Progress({
            value: this.completedNumber,
            total: this.totalNumber,
            type: ProgressType.Ring,
          })
            .color('#007DFF')
            .width(55)
            .height(55)
        }
        .backgroundColor(Color.Transparent)
        .width(60)
        .height(60)
      }
      .padding(10)
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(VerticalAlign.Bottom)
      .width('100%')
      .height('50%')
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    .borderRadius(20)
    .backgroundColor(Color.White)
  }
}