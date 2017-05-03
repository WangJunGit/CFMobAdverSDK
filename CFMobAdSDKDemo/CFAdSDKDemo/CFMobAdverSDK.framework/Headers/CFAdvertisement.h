//
//  CFAdvertisement.h
//  CFMobAdSDK
//
//  Created by 李成福 on 2017/3/8.
//  Copyright © 2017年 LCF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CFMobAdCommonConfig.h"

@interface CFAdvertisement : NSObject

/*
 *  程序初始化配置
 *
 *  appID: 注册SDK的唯一标识
 *  developModel: 开发环境
 */
+ (void)registerAppID:(NSString *)appID developModel:(CFSDKMode) developModel;

@end
