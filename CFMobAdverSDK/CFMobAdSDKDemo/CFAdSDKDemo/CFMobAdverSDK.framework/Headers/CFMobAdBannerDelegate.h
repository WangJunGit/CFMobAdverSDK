//
//  CFMobAdBanDelegate.h
//  CFMoAdDemoApp
//
//  Created by 得威 on 2017/2/15.
//  Copyright © 2017年 LCF. All rights reserved.
//

#import "CFMobAdCommonConfig.h"

@protocol CFMobAdBannerDelegate <NSObject>

/// 广告展示成功
- (void)bannerSuccessPresentScreen;

/// 广告展示失败
- (void)bannerFailPresentScreenWithError:(CFMobFailReason) reason;

/// 广告被点击
- (void)bannerDidClicked;

/// 广告详情页消失
- (void)bannerDidDismissLp;

@end

