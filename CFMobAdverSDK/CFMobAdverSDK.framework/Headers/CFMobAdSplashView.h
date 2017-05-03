//
//  CFMobAdSplash.h
//  CFMoAdDemoApp
//
//  Created by  on 2017/2/7.
//  Copyright © 2017年 LCF. All rights reserved.
//  开屏广告

#import <UIKit/UIKit.h>
#import "CFMobAdSplashDelegate.h"


@interface CFMobAdSplashView : UIView

/// 代理委托对象
@property(assign ,nonatomic)id<CFMobAdSplashDelegate> delegate;

/// 设置开屏广告是否可以点击的属性,开屏默认可以点击。
@property (nonatomic) BOOL canSplashClick;

/// 应用启动时展示全屏开屏广告
- (void)loadAndDisplayUsingKeyWindow:(UIWindow *)keyWindow;

/// 应用启动时展示半屏开屏广告
- (void)loadAndDisplayUsingContainerView:(UIView *)view;

@end
