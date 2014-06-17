//
//  AppInfo.m
//  SplusIosSdk
//
//  Created by akzhang on 14-6-13.
//  Copyright (c) 2014年 akzhang. All rights reserved.
//

#import "AppInfo.h"

@implementation AppInfo

+ (AppInfo *)sharedSingleton{
    static AppInfo *sharedSingleton = nil;
    @synchronized(self){
        if (!sharedSingleton) {
            sharedSingleton = [[AppInfo alloc] init];
            return sharedSingleton;
        }
    }
    return sharedSingleton;
}

//自定义user类传值
-(void)initWithType:(NSString*)gameID GameKey:(NSString*)gameKey SourceID:(NSString*)sourceID{
    _gameID = gameID;
    _gameKey = gameKey;
    _sourceID = sourceID;
}

-(NSString*)getData
{
    NSString* date;
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYY-MM-dd%20hh:mm:ss"];
    date = [formatter stringFromDate:[NSDate date]];
    return date;
}
@end
