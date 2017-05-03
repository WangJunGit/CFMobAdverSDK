//
//  CFMobAdNormalInterstitialViewController.m
//  CFMoAdDemoApp
//
//  Created by 得威 on 2017/2/9.
//  Copyright © 2017年 LCF. All rights reserved.
//

#import "CFMobAdNormalInterstitialViewController.h"
#import <CFMobAdverSDK/CFMobAdInterstitialView.h>
#import <Foundation/Foundation.h>
#define kCustomIntWidth 300
#define kCustomIntHeight 300

#include <objc/runtime.h>


@interface CFMobAdNormalInterstitialViewController ()<CFMobAdInterstitiaDelegate,UIAlertViewDelegate>
@property (nonatomic, assign) int curType;
/// 插屏广告
@property(strong ,nonatomic)CFMobAdInterstitialView *interstitialView;

@property (nonatomic, retain) UIView *customAdView;

@property (nonatomic, retain) UIButton *loadButton;

@property (nonatomic, retain) UIButton *loadCustomButtonWithCount;

@property(strong ,nonatomic)UIButton  *customButton;
@end

@implementation CFMobAdNormalInterstitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *loadBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    loadBtn.frame = CGRectMake(20, 100, 200, 50);
    [loadBtn setTitle:@"请求全屏插屏" forState:UIControlStateNormal];
    loadBtn.tag = 101;
    [loadBtn addTarget:self action:@selector(pressToLoadAd:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loadBtn];
    self.loadButton = loadBtn;
    
    
    UIButton *loadCustomButtonWithCount = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    loadCustomButtonWithCount.frame = CGRectMake(20, 200, 200, 50);
    [loadCustomButtonWithCount setTitle:@"自定义插屏" forState:UIControlStateNormal];
    loadCustomButtonWithCount.tag = 102;
    [loadCustomButtonWithCount addTarget:self action:@selector(pressToLoadAd:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loadCustomButtonWithCount];
    self.loadCustomButtonWithCount = loadCustomButtonWithCount;
    
    UIButton *customButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    customButton.frame = CGRectMake(20, 300, 200, 50);
    [customButton setTitle:@"请求居中显示插屏" forState:UIControlStateNormal];
    customButton.tag = 103;
    [customButton addTarget:self action:@selector(pressToLoadAd:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:customButton];
    self.customButton = customButton;
    
    
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.interstitialView removeFromSuperview];
}
- (void)pressToLoadAd:(UIButton *)btn {
    self.interstitialView = [[CFMobAdInterstitialView alloc] init];
    self.interstitialView.delegate = self;
    self.interstitialView.enableLocation = YES;
    switch (btn.tag) {
        case 101:
            self.interstitialView.interstitialType = CFMobAdViewTypeInterstitialOther;
            self.interstitialView.interstitialShowType = CFMobAdInterstitialShowType_Full;
            [self.interstitialView load];
            _curType = 1;
            break;
        case 102:
            self.interstitialView.interstitialType = CFMobAdViewTypeInterstitialOther;
        
            [self.interstitialView loadUsingSize:CGRectMake(0, 0, kCustomIntWidth, kCustomIntHeight)];
            _curType = 2;
            break;
        case 103:
            self.interstitialView.interstitialType = CFMobAdViewTypeInterstitialOther;
            self.interstitialView.interstitialShowType = CFMobAdInterstitialShowType_Custom;
            [self.interstitialView load];
            _curType = 1;
            break;
        default:
            break;
    }
}
- (void)pressToShowAd:(UIButton *)btn {
    
    // 2
    if (self.interstitialView.isReady) {
        if (_curType == 1) {
            [self.interstitialView presentFromRootViewController:self];
        } else {
            UIView *customAdView = [[UIView alloc]initWithFrame:CGRectMake(0, 150, kCustomIntWidth, kCustomIntHeight)];
            customAdView.backgroundColor = [UIColor whiteColor];
            [self.view addSubview:customAdView];
            [self.interstitialView presentFromView:customAdView];
            self.customAdView = customAdView;
        }
    } else {
        NSLog(@"not ready yet");
    }
}

/// 广告预加载成功
- (void)interstitialSuccessToLoadAd{
    
    if (_curType != 4) {
        UIAlertView *alv = [[UIAlertView alloc]initWithTitle:@"加载成功"
                                                     message:@"点击显示广告"
                                                    delegate:self
                                           cancelButtonTitle:@"ok"
                                           otherButtonTitles: nil];
        [alv show];
    }
}

/// 广告预加载失败
- (void)interstitialFailToLoadAd:(CFMobFailReason)reason{
    
    UIAlertView *alv = [[UIAlertView alloc]initWithTitle:@"加载失败"
                                                 message:@""
                                                delegate:self
                                       cancelButtonTitle:@"ok"
                                       otherButtonTitles: nil];
    [alv show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    [self pressToShowAd:nil];
}

/// 广告即将展示
- (void)interstitialWillPresentScreen{}

/// 广告展示成功
- (void)interstitialSuccessPresentScreen{}

/// 广告展示失败
- (void)interstitialFailPresentScreenWithError:(CFMobFailReason) reason{}

/// 广告展示被用户点击时的回调
- (void)interstitialDidAdClicked{
    [self.interstitialView removeFromSuperview];
}

/// 广告详情页结束
- (void)interstitialDidDismissLandingPage{
    if (_curType == 2 ) {
        [self.customAdView removeFromSuperview];
    }
    
    [self.interstitialView removeFromSuperview];
}
/// 广告关闭
- (void)interstitialDidDismissScreen{
    if (_curType == 2 ) {
        [self.customAdView removeFromSuperview];
    }
    
    [self.interstitialView removeFromSuperview];
}
- (void)dealloc {

    self.interstitialView.delegate = nil;
    [self.interstitialView removeFromSuperview];
    if (self.customAdView) {
        [self.customAdView removeFromSuperview];
    }
}
-  (IBAction)clickLoadAd:(id)sender {
    self.interstitialView = [[CFMobAdInterstitialView alloc] init];
    self.interstitialView.delegate = self;
    
    self.interstitialView.interstitialType = CFMobAdViewTypeInterstitialOther;
    
    //加载全屏插屏
    [self.interstitialView load];
}
@end













