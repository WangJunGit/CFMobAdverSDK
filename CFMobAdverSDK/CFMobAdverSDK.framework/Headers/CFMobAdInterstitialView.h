//
//  CFMobAdInterstitialView.h
//  CFMoAdDemoApp
//
//  Created by 得威 on 2017/2/9.
//  Copyright © 2017年 LCF. All rights reserved.
//  插屏广告

#import <UIKit/UIKit.h>
#import "CFMobAdCommonConfig.h"
#import "CFMobAdInterstitiaDelegate.h"

@interface CFMobAdInterstitialView : UIView
/// 代理-委托对象
@property(assign ,nonatomic)id<CFMobAdInterstitiaDelegate> delegate;

/// 插屏广告类型
@property(assign ,nonatomic)CFMobAdInterstitialType interstitialType;

/// 插屏广告显示方式: 加载自定义大小的插屏时不用设置
@property(assign ,nonatomic)CFMobAdInterstitialShowType interstitialShowType;

/// 插屏广告是否准备好
@property (nonatomic) BOOL isReady;

/// 加载插屏广告
- (void)load;

/// 加载自定义大小的插屏,必须大于100*150
- (void)loadUsingSize:(CGRect)rect;

/// 展示全屏插屏广告
- (void)presentFromRootViewController:(UIViewController *)rootViewController;

/// 展示自定义大小的插屏
- (void)presentFromView:(UIView *)view;

/// 是否发送位置信息(默认发送)
@property(assign,nonatomic,getter=isEnableLocaton)BOOL enableLocation;

@end
