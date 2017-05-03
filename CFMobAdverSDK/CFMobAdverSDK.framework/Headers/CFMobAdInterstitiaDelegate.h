//
//  CFMobAdInterstitiaDelegate.h
//  CFMoAdDemoApp
//
//  Created by 得威 on 2017/2/9.
//  Copyright © 2017年 LCF. All rights reserved.
//

#import "CFMobAdCommonConfig.h"

@protocol CFMobAdInterstitiaDelegate <NSObject>

@optional



/// 广告预加载成功
- (void)interstitialSuccessToLoadAd;

/// 广告预加载失败
- (void)interstitialFailToLoadAd:(CFMobFailReason)reason;

/// 广告即将展示
- (void)interstitialWillPresentScreen;

/// 广告展示成功
- (void)interstitialSuccessPresentScreen;

/**
 *  广告展示失败
 *  reason:错误原因
 */
- (void)interstitialFailPresentScreenWithError:(CFMobFailReason) reason;

/// 广告展示被用户点击时的回调
- (void)interstitialDidAdClicked;

/// 广告展示结束
- (void)interstitialDidDismissScreen;

/// 广告详情页被关闭
- (void)interstitialDidDismissLandingPage;

@end
