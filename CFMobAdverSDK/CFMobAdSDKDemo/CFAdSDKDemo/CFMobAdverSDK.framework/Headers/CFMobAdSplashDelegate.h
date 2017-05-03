//
//  CFMobAdSplashDelegate.h
//  CFMoAdDemoApp
//
//  Created by 得威 on 2017/2/8.
//  Copyright © 2017年 LCF. All rights reserved.
//



#import "CFMobAdCommonConfig.h"

@protocol CFMobAdSplashDelegate <NSObject>


@optional

/// 广告预加载成功
- (void)splashDidSuccessToLoadAd;

/// 广告预加载失败
- (void)splashFailToLoadAd:(CFMobFailReason)reason;

/// 广告即将展示
- (void)splashWillPresentScreen;

/// 广告展示成功
- (void)splashSuccessPresentScreen;

/// 广告展示失败
- (void)splashlFailPresentScreenWithError:(CFMobFailReason) reason;

/// 广告被点击
- (void)splashDidClicked;

/// 广告展示结束
- (void)splashDidDismissScreen;

/// 广告详情页消失
- (void)splashDidDismissLp;

@end

