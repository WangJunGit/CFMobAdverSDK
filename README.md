# CFMobAdverSDK

CFMobAdverSDK一款轻量级的广告SDK,包括开屏广告,横幅广告,插屏广告

## Cocoapods安装

```pod 'CFMobAdverSDK', '~> 1.0.1'```

# 广告SDK接入说明
#### 一、简介
SDK下载-->SDK配置代码-->广告测试-->App发布 
#### 二、阅读对象
本文档面向所有使用该 SDK 的开发人员、测试人员以及对此感兴趣的其他用户。 
#### 三、版本支持
iOS 8.0

#### 四、开发示例
>注:以下截图均在示例程序(CFMobAdSDKDemom)中可以找到. 


- 在`info.plist`中,在`NSAppTransportSecurity`下设置`NSAllowsArbitraryLoads`为 `true`:

    ![B833C92A-55CF-4612-B560-3438EAFA2A81.png](http://upload-images.jianshu.io/upload_images/1009061-c845a5d2e3a8a2a0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 允许在前台使用时获取GPS的描述 `NSLocationAlwaysUsageDescription=YES` 
- 允许永久使用GPS的描述 `NSLocationWhenInUseUsageDescription=YES`

    ![CA665E82-9381-408B-B53F-6D78E3F90E76.png](http://upload-images.jianshu.io/upload_images/1009061-e4f41296883c5ed0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 把`other linker flags` 设置成`-ObjC`

  ![32DBB0A3-6A06-44B7-A1C9-6DC6CD15CEC0.png](http://upload-images.jianshu.io/upload_images/1009061-5bf52cf46407bae5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
 
- `Build Phases`--->`Link Bunary With Libraries` 添加库`AdSupport.framework`,`CoreLocation.framework`.

- 修改下面方法中的`AppID`的值为自己的`AppID`，并配置自己的开发环境 
```
[CFAdvertisement registerAppID:@"0446c3a9b4da4810aebd8c2fc8dd1a74"
 developModel:CFSDKModeDevelopment];
 ```
 
 
#### 编译前的准备工作:
- 确保内容包括:`SDK`、`AdSupport.framework`、`CoreLocation.framework`

### 1.横幅广告 
1.初始广告视图:

First Header | Second Header
------------ | -------------
1 | 初始化广告视图实例
2 | 设置frame和delegate，广告类型等属性
3 | 启动广告(start)

```
 #import "CFMobAdView.h"
- (void)viewDidLoad {
    [super viewDidLoad];
    //使 嵌  告的 法实 。
    self.bannerView = [[CFMobAdView alloc] init];        
    self.bannerView.adType = CFMobAdViewTypeBanner;
    CGFloat bannerY = kScreenHeight - 0.15*kScreenWidth; 
    self.bannerView.frame = CGRectMake(0, bannerY, kScreenWidth, 0.15*k
ScreenWidth);
    [self.view addSubview:self.bannerView];
    self.bannerView.delegate = self;
    [self.bannerView start];
    //    sharedAdView.delegate = self;
    [self.bannerView start];
}
```
2.可选 delegate 接口

```
///  广告展示成功
 - (void)bannerSuccessPresentScreen{
}
///  广告展示失败
- (void)bannerFailPresentScreenWithError:(CFMobFailReason) reason{
}
///  广告被点击
- (void)bannerDidClicked{
}
///  广告详情消失
- (void)bannerDidDismissLp{
}
```
### 2.开屏广告
##### 全屏开屏广告的使用
1.展示开屏广告
在`- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions: (NSDictionary *)launchOptions `中

First Header | Second Header
------------ | -------------
1     | 初始化开屏广告实例
2 | 设置 delegate，广告类型等属性。
3 | 加载广告(loadAndDisplayUsingKeyWindow)

开屏属性中 `canSplashClick` 为开屏是否可以点击属性，默认为可以点击。(投不可点击 的广告主较少,建议使用默认设置即可.)

```
 // 全屏 告
CFMobAdSplashView *splashView = [[CFMobAdSplashView alloc] init];
splashView.delegate = self;
splashView.canSplashClick = YES;
[splashView loadAndDisplayUsi
```
2.可选 `delegate` 接口
在开屏广告的生命周期内，会通过 `delegate` 通知回调相关事件:开屏广告加载是否成 功、展示是否成功、展示开始、展示结束等信息。如需要，您可以利用这些信息进行 处 理，建议在开屏广告展示成功结束，或者广告展示失败的回调进行后续处理,详细使 用 方法请参见 `CFMobAdSplashDelegate.h`

##### 半屏开屏广告的使用 为了方便开屏广告嵌入 app 的 icon 和自定义背景，引入半屏 开屏广告

First Header |Second Header
------------ | ------------
1 | 初始化自定义开屏 customSplashView 并添加到 window
2 | 初始化开屏广告容器 SplashContainer 并添加到 customSplashView
3 | 初始化 CFMobAdSplashView
4 | 设置 delegate 和开屏属性
5 | 在 SplashContainer 内加载广告 (loadAndDisplayUsingContainerView)

1.展示开屏广告(在`- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 中)` 开屏属性中 `canSplashClick` 为开屏是否可以点击属性，默认为可以点击

> 注意:半屏幕开屏尺寸必须大于 `200*200`，并且落在 window 内部

```
 - (BOOL)application:(UIApplication *)application didFinishLaunchingWith
Options:(NSDictionary *)launchOptions {
    //  定义开屏
    CFMobAdSplashView *splashView = [[CFMobAdSplashView alloc] init]; 
    splashView.delegate = self;
    self.splashView = splashView;
    [self.window addSubview:splashView];
    
    //可以在customSplashView上显示包含icon的 定义开屏
    self.customSplashView = [[UIView alloc] initWithFrame:self.window.frame];
    self.customSplashView.backgroundColor = [UIColor whiteColor];
    [self.window addSubview:self.customSplashView];
    CGFloat screenWidth = self.window.frame.size.width;
    CGFloat screenHeight = self.window.frame.size.height;
    
    //在SplashContainer 做上展现 告的容 ，注意尺 必须 于200*200，并且Splas hContainer需要全部在window内，同时开机画  建议旋转
    UIView * SplashContainer = [[UIView alloc]initWithFrame:CGRectMake(
0, 0, screenWidth, screenHeight - 40)];
    [self.customSplashView addSubview:SplashContainer];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, screen
Height - 40, screenWidth, 20)];
    label.text = @"上 为开屏 告位"; 
    label.textAlignment = NSTextAlignmentCenter;             
    [self.customSplashView addSubview:label];
    
    //在的SplashContainer 展现 告
    [splashView loadAndDisplayUsingContainerView:SplashContainer];
return YES; 

}
```

2.可选 `delegate` 接口
在开屏广告的生命周期内，会通过 `delegate` 通知回调相关事件:开屏广告加载是否成 功、展示是否成功、展示开始、展示结束等信息。如需要，您可以利用这些信息进行 处 理，建议在开屏广告展示成功结束，或者广告展示失败的回调进行后续处理。对于半 屏 开屏，建议在广告展示失败和结束时移除自定义的 `customSplashView`

```
/**
 *  广告告展示失败 
 */
- (void)splashlFailPresentScreenWithError:(CFMobFailReason) reason{
     NSLog(@"%s",__func__);
    [self.customSplashView removeFromSuperview];
}

/**
 *  广告被点击 
 */
- (void)splashDidClicked{
    NSLog(@"%s",__func__);
    [self.customSplashView removeFromSuperview];
}
/**
 *  广告展示结束 
 */
- (void)splashDidDismissScreen{
    NSLog(@"%s",__func__);
    [self.customSplashView removeFromSuperview];
}

```
### 3.插屏广告
##### 插屏广告的使用
1.预加载插屏广告

序号 | 详细信息
----| ----
1 | 初始化插屏广告实例
2 | 设置delegate,广告类型等属性
3 | 预加载广告(load)
4 | 展示广告(show)

```
 - (IBAction)clickLoadAd:(id)sender {
    self.interstitialView = [[CFMobAdInterstitialView alloc] init]; 
    self.interstitialView.delegate = self;
    //插屏类型
    self.interstitialView.interstitialType = CFMobAdViewTypeInterstitialOther; 
    //插屏显示类型
    self.interstitialView.interstitialShowType = CFMobAdInterstitialShowType_Full;
    //加载全屏插屏
    [self.interstitialView load];
}
```
插屏广告有以下几种应用场景:

- 普通场景中使用`CFMobAdViewTypeInterstitialOther`    
- 视频图片前贴片`CFMobAdViewTypeInterstitialBeforeVideo`    
- 视频暂停贴片`CFMobAdViewTypeInterstitialPauseVideo` 

> 目前只使用第一种普通场景,也可以不设置

插屏广告显示类型:

- 全屏插屏:`CFMobAdInterstitialShowType_Full` 
- -居中插屏,大小由返回图片大小决定,图片最大为全 屏:`CFMobAdInterstitialShowType_Custom` 
- 自定义填充`CFMobAdInterstitialShowType_Full _Custom`

2.展示插屏广告

```
 // 注意:这里要先确定isReady之后在调presentFromRootViewController: 法,否则 可能 会显示,可以根据interstitialSuccessToLoadAd 法确定
if (self.interstitialView.isReady) {
    if (_curType == 1) {
    
         [self.interstitialView presentFromRootViewController:self];
    }
}
```
3.可选`delegate`接口 在插屏广告的生命周期内,贵通过`delegate`通知回调相关事件:插屏广告加载是否成功,展 示是否成功,展示开始和展示结束等具体方法请请参加`CFMobAdInterstitiaDelegate.h`


