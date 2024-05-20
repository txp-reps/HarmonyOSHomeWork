import router from '@ohos.router';

@Extend(Line) function lineStyle() {
  .width('100%')
  .height(1)
  .backgroundColor('#33182431')
}

@Entry
@Component
struct Login {
  @State account: string = "";
  @State password: string = "";

  build() {
    Column({ space: 20 }) {
      Image($r("app.media.logo"))
        .height(78)
        .width(78)
        .margin(
          {
            top: 90,
            bottom: 20
          }
        )
      Text("登录页面")
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
      Text("登录账号已使用更多服务")
      TextInput({ placeholder: "账号" })
        .backgroundColor(Color.Transparent)
        .onChange((value) => {
          this.account = value
        })

      Line().lineStyle()

      TextInput({ placeholder: "密码" })
        .type(InputType.Password)
        .backgroundColor(Color.Transparent)
        .onChange((value) => {
          this.password = value
        })

      Line().lineStyle();

      Row() {
        Text("短信验证码登录")
        Text("忘记密码")
      }
      .width("100%")
      .justifyContent(FlexAlign.SpaceBetween)

      Blank()
      Button("登录")
        .type(ButtonType.Capsule)
        .width("90%")
        .onClick(() => {
          if (this.account !== "" || this.password !== "") {
            router.replaceUrl({ url: 'pages/Objective' });
          }
        })
      Text("注册账号")
        .fontColor("#007DFF")

      Blank()
      Blank()
      Text("其他方式登录")
      Row() {
        this.loginMethodButton($r("app.media.login_method1"))
        this.loginMethodButton($r("app.media.login_method2"))
        this.loginMethodButton($r("app.media.login_method3"))
      }
      .width("100%")
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .padding(20)
  }

  @Builder
  private loginMethodButton(image: Resource) {
    Button({ type: ButtonType.Circle, stateEffect: true }) {
      Image(image)
    }
    .height(48)
    .width(48)
    .backgroundColor("#F1F3F5")
  }
}