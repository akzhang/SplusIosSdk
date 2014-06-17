//
//  SplusInterfaceKit.m
//  SplusIosSdk
//
//  Created by akzhang on 14-6-13.
//  Copyright (c) 2014年 akzhang. All rights reserved.
//

#import "SplusInterfaceKit.h"
#import "AppInfo.h"
#import "Activate.h"
#import "Login.h"

@implementation SplusInterfaceKit

__strong static SplusInterfaceKit *singleton = nil;

/**
 *  API单例
 *
 *  @return 返回单例
 */
+(SplusInterfaceKit*)sharedInstance
{
    static dispatch_once_t pred = 0;
    dispatch_once(&pred, ^{
        //singleton = [[self alloc] init];
        singleton = [[super allocWithZone:NULL] init];
    });
    return singleton;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedInstance];
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

/**
 *  设置委托
 *
 *  @param argDelegate 委托
 */
-(void)setDelegate:(id<SplusCallback>)argDelegate
{
    _delegate = argDelegate;
}

/**
 *  CP商渠道号，游戏ID，游戏ID，渠道号从Splus后台获取
 *
 *  @param AppId       游戏ID
 *  @param argSourceId 渠道ID
 *  @param argGameKey 游戏key
 */
-(void) setApp:(NSString*)AppId GameKey:(NSString*)argGameKey SourceID:(NSString*)argSourceId
{
    [AppInfo sharedSingleton].gameID = AppId;
    [AppInfo sharedSingleton].gameKey = argGameKey;
    [AppInfo sharedSingleton].sourceID = argSourceId;
}

/**
 *  激活接口
 */
-(void)activate:(UIViewController*)context
{
    Activate *active = [[Activate alloc] init];
    active.delegate = _delegate;//设置委托
    [context.navigationController pushViewController:active animated:NO];
}

/**
 *  登录接口
 */
-(void)splusLogin:(UIViewController*)context
{
    Login *login = [[Login alloc] init];
    login.delegate = _delegate;
    [context.navigationController pushViewController:login animated:NO];
    
}

@end
