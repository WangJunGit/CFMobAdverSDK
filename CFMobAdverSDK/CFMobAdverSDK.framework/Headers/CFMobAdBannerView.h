//
//  CFMobAdView.h
//  CFMoAdDemoApp
//
//  Created by 得威 on 2017/2/8.
//  Copyright © 2017年 LCF. All rights reserved.
//  横幅广告

#import <UIKit/UIKit.h>
#import "CFMobAdCommonConfig.h"
#import "CFMobAdBannerDelegate.h"

@interface CFMobAdBannerView : UIView

///  设置／获取需要展示的广告类型
@property(assign ,nonatomic)CFMobAdViewType adType;

/// 代理委托对象
@property(assign ,nonatomic)id<CFMobAdBannerDelegate> delegate;

/// 开始广告展示请求,会触发所有资源的重新加载，
- (void)start;

@end
