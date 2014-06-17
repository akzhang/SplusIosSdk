//
//  Login.m
//  SplusIosSdk
//
//  Created by akzhang on 14-6-17.
//  Copyright (c) 2014年 akzhang. All rights reserved.
//

#import "Login.h"

@interface Login ()

@end

@implementation Login

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
    [_splusLoginBgView setBackgroundColor:[UIColor whiteColor]];

    [_splusRemPwd initWithDelegate:self];
    
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - QCheckBoxDelegate

- (void)didSelectedCheckBox:(QCheckBox *)checkbox checked:(BOOL)checked {
    NSLog(@"did tap on CheckBox:%@ checked:%d", checkbox.titleLabel.text, checked);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
