//
//  CFMobAdCommonConfig.h
//  CFMoAdDemoApp
//
//  Created by 得威 on 2017/2/9.
//  Copyright © 2017年 LCF. All rights reserved.
//

#ifndef CFMobAdCommonConfig_h
#define CFMobAdCommonConfig_h


#endif /* CFMobAdCommonConfig_h */

typedef NS_ENUM(NSInteger, CFNetWorkState) {
    CFNetWorkStateNot = 0,
    // 没有网
    CFNetWorkStateWWAN = 1,
    //手机网络
    CFNetWorkStateWIFI = 2
    //WIFI
};

/**
 * 广告错误类型
 * 0 banner 插屏
 */
typedef NS_ENUM(NSInteger, CFMobFailReason) {
    CFMobFailReason_NOAD = 0,
    // 没有推广返回
    CFMobFailReason_EXCEPTION,
    //网络或其它异常
    CFMobFailReason_FRAME
    //广告尺寸异常，不显示广告
};

/**
 * 广告类型
 * 0 banner 横幅广告
 */
typedef NS_ENUM(NSInteger, CFMobAdViewType) {
    CFMobAdViewTypeBanner = 0,
    
};

/*
 * 10 插屏广告：其他场景中使用 CFMobAdViewTypeInterstitialOther
 * 11 插屏广告：视频图片前贴片 CFMobAdViewTypeInterstitialBeforeVideo 有倒计时5s
 * 12 插屏广告：视频暂停贴片 CFMobAdViewTypeInterstitialPauseVideo 没有倒计时
 * 11 12暂时不用-
 */
typedef NS_ENUM(NSInteger, CFMobAdInterstitialType) {
    CFMobAdViewTypeInterstitialOther = 10,
    CFMobAdViewTypeInterstitialBeforeVideo = 11,
    CFMobAdViewTypeInterstitialPauseVideo = 12
    
};


/**
 * 插屏广告显示方式

 * CFMobAdInterstitialShowType_Full: 全屏显示
 * CFMobAdInterstitialShowType_custom:居中自定义-大小由返回图片大小决定,图片最大为全屏
 * CFMobAdInterstitialShowType_Full_Custom:自定义填充--暂时不用
 */
typedef NS_ENUM(NSInteger, CFMobAdInterstitialShowType) {
    CFMobAdInterstitialShowType_Full = 1,          // 全屏显示
    CFMobAdInterstitialShowType_Custom = 2,        // 居中自定义
    CFMobAdInterstitialShowType_Full_Custom = 3,   // 自定义填充
};

/**
 * 当前广告环境
 */
typedef NS_ENUM(NSInteger, CFSDKMode){
    CFSDKModeDevelopment, // 开发测试环境
    CFSDKModeProduction, // AppStore 上线环境  AdHoc 内部测试用的生产环境
};


