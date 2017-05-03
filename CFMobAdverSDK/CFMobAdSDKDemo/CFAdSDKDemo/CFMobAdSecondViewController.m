//
//  CFMobAdSecondViewController.m
//  CFMoAdDemoApp
//
//  Created by 得威 on 2017/2/6.
//  Copyright © 2017年 LCF. All rights reserved.
//

#import "CFMobAdSecondViewController.h"
#import <CFMobAdverSDK/CFMobAdBannerView.h>
#define kScreenWidth self.view.frame.size.width
#define kScreenHeight self.view.frame.size.height
@interface CFMobAdSecondViewController ()<CFMobAdBannerDelegate>

/// 横幅广告
@property(strong ,nonatomic)CFMobAdBannerView *bannerView;
@end

@implementation CFMobAdSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"横幅悬浮样式";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addText];
    [self addAdView];
}
- (void)addText {
    UITextView *textView = [[UITextView alloc]init];
    CGFloat textH = kScreenHeight-64;
    textView.frame = CGRectMake(0, 0, kScreenWidth, textH);
    textView.font = [UIFont systemFontOfSize:16];
    textView.editable = NO;
    [self.view addSubview:textView];
    textView.text = @"丰富的广告样式说明\n\n1. 横幅：常见的移动广告样式，以通栏式或矩形式出现在应用中\n使用场景：用户停留较久或者访问频繁的页面\n优势：适用媒体范围广，接入成本低，自然展现于媒体页面中，用户认可度高\n\n2. 开屏：应用开启后全屏展现的广告样式（支持底部展示媒体LOGO）\n使用场景：应用启动时\n优势：视觉效果震撼，提升媒体品牌价值渗透，广告点击率高，变现能力出色\n\n3. 插屏：基于用户使用场景切换，插入半屏或全屏的广告形式\n使用场景：应用内视图切换、游戏过关或失败、图书翻页、应用退出等\n优势：交互场景丰富，减少对应用界面的占用，深受广告主青睐，预算能力充足\n\n";
}

- (void)addAdView {
   
    //使用嵌入广告的方法实例。
    self.bannerView = [[CFMobAdBannerView alloc] init];
    self.bannerView.adType = CFMobAdViewTypeBanner;
    CGFloat bannerY = kScreenHeight - 0.15*kScreenWidth;
    self.bannerView.frame = CGRectMake(0, bannerY, kScreenWidth, 0.15*kScreenWidth);
    [self.view addSubview:self.bannerView];
    
    self.bannerView.delegate = self;
    [self.bannerView start];
    
}
- (void)dealloc{
    self.bannerView = nil;
}
/// 广告展示成功
- (void)bannerSuccessPresentScreen{
    
}

/// 广告展示失败
- (void)bannerFailPresentScreenWithError:(CFMobFailReason) reason{
    
}

/// 广告被点击
- (void)bannerDidClicked{
    
}

/// 广告详情页消失
- (void)bannerDidDismissLp{
    
}

@end
