//
//  AppDelegate.m
//  CFMoAdDemoApp
//
//  Created by 得威 on 2017/2/6.
//  Copyright © 2017年 LCF. All rights reserved.
//

#import "AppDelegate.h"
#import "MainTableViewController.h"
#import <CFMobAdverSDK/CFMobAdSplashView.h>

#import <CFMobAdverSDK/CFAdvertisement.h>

@interface AppDelegate ()<CFMobAdSplashDelegate>
/// 自定义开屏
@property(strong ,nonatomic)CFMobAdSplashView *splashView;
/// 自定义View,用于开屏View
@property(strong ,nonatomic)UIView *customSplashView;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    MainTableViewController *mainController  = [[MainTableViewController alloc]init];
    UINavigationController *naviController = [[UINavigationController alloc]initWithRootViewController:mainController];
//    self.window.rootViewController = [[CFMobAdFirstViewController alloc] init];;
    self.window.rootViewController = naviController;
    [self.window makeKeyAndVisible];
    
    // 注册
    [CFAdvertisement registerAppID:@"17a6f0b66dab44fabf5f40e8b9c36786" developModel:CFSDKModeDevelopment];
    
     //全屏开屏
//    CFMobAdSplashView *splashView = [[CFMobAdSplashView alloc] init];
//    splashView.delegate = self;
//    splashView.canSplashClick = YES;
//    [splashView loadAndDisplayUsingKeyWindow:self.window];
//    self.splashView = splashView;
    
    // 自定义开屏
    CFMobAdSplashView *splashView = [[CFMobAdSplashView alloc] init];
    splashView.delegate = self;
    self.splashView = splashView;
    [self.window addSubview:splashView];
    
    //可以在customSplashView上显示包含icon的自定义开屏
    self.customSplashView = [[UIView alloc] initWithFrame:self.window.frame];
    self.customSplashView.backgroundColor = [UIColor whiteColor];
    [self.window addSubview:self.customSplashView];
    
    CGFloat screenWidth = self.window.frame.size.width;
    CGFloat screenHeight = self.window.frame.size.height;
    
    //在SplashContainer用做上展现广告的容器，注意尺寸必须大于200*200，并且baiduSplashContainer需要全部在window内，同时开机画面不建议旋转
    UIView * SplashContainer = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight - 40)];
    [self.customSplashView addSubview:SplashContainer];

    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, screenHeight - 40, screenWidth, 20)];
    label.text = @"上方为开屏广告位";
    label.textAlignment = NSTextAlignmentCenter;
    [self.customSplashView addSubview:label];
    
    //在的SplashContainer里展现广告
    [splashView loadAndDisplayUsingContainerView:SplashContainer];
    
    
    return YES;
}
/**
 *  广告展示成功
 */
- (void)splashSuccessPresentScreen{
     NSLog(@"%s",__func__);
}

/**
 *  广告展示失败
 */
- (void)splashlFailPresentScreenWithError:(CFMobFailReason) reason{
     NSLog(@"%s",__func__);
    [self removeSplash];
}

/**
 *  广告被点击
 */
- (void)splashDidClicked{
    NSLog(@"%s",__func__);
    [self removeSplash];
}

/**
 *  广告展示结束
 */
- (void)splashDidDismissScreen{
    NSLog(@"%s",__func__);
    [self removeSplash];
}

/**
 *  展示结束or展示失败后, 手动移除splash和delegate
 */
- (void) removeSplash {
    if (self.splashView) {
        self.splashView.delegate = nil;
//        self.splashView = nil;
        [self.splashView removeFromSuperview];
        [self.customSplashView removeFromSuperview];
    }
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
