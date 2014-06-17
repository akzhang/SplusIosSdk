//
//  Activate.m
//  SplusIosSdk
//
//  Created by akzhang on 14-6-13.
//  Copyright (c) 2014年 akzhang. All rights reserved.
//

#import "Activate.h"
#import "NSDictionary+QueryBuilder.h"

@interface Activate ()

@end

@implementation Activate

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //设置loading
    _HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:_HUD];
    _HUD.removeFromSuperViewOnHide = YES;
    _HUD.dimBackground = YES;
    _HUD.labelText = @"玩命加载中...";
    [_HUD show: YES];
    
    //激活信息
    NSString *sign = @"";
    sign = [sign stringByAppendingFormat:@"%@%@%@%@%@%@%@", [AppInfo sharedSingleton].gameID, [AppInfo sharedSingleton].sourceID, @"1",[qqMac getMacAddress], [qqMac getMacAddress],[[AppInfo sharedSingleton] getData], [AppInfo sharedSingleton].gameKey];
    
    CGFloat scale_screen = [UIScreen mainScreen].scale;
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:[AppInfo sharedSingleton].gameID, @"gameid",
                                [AppInfo sharedSingleton].sourceID,@"referer",
                                @"1", @"partner",
                                [qqMac getMacAddress], @"mac",
                                [qqMac getMacAddress], @"imei",
                                [NSString stringWithFormat:@"%f",SCREENWIDTH*scale_screen], @"wpixels",
                                [NSString stringWithFormat:@"%f",SCREENHEIGHT*scale_screen], @"hpixels",
                                [UIDevice currentDevice].model, @"mode",
                                [[UIDevice currentDevice] systemName], @"os",
                                [[UIDevice currentDevice] systemVersion], @"osver",
                                [[AppInfo sharedSingleton] getData], @"time",
                                [MyMD5 md5:sign], @"sign",
                                [[UIDevice currentDevice] identifierForVendor], @"device",nil];
    
    NSString *postData = [dictionary buildQueryString];
    
    httpRequest *_request = [[httpRequest alloc] init];
    _request.dlegate = self;
    _request.success = @selector(active_callback:);
    [_request post:API_URL_ACTIVATE argData:postData];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)active_callback:(NSString*)result
{
    NSLog(@"result = %@", result);
    if (_HUD != NULL) {
        [_HUD hide:YES];
    }
    
    sleep(2);
    //激活成功，callback
    [_delegate SplusActivateOnSuccess];
    [self.navigationController popToRootViewControllerAnimated:NO];

}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}







@end
