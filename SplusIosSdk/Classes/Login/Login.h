//
//  Login.h
//  SplusIosSdk
//
//  Created by akzhang on 14-6-17.
//  Copyright (c) 2014年 akzhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QCheckBox.h"
#import "SplusCallback.h"

@interface Login : UIViewController<QCheckBoxDelegate>

@property(nonatomic, retain)id<SplusCallback> delegate;

@property (strong, nonatomic) IBOutlet UIImageView *splusLoginBgView;//设置背景图

@property (strong, nonatomic) IBOutlet UITextField *splusLoginUser;//用户名输入框

@property (strong, nonatomic) IBOutlet UITextField *splusLoginPwd;//密码输入框

@property (strong, nonatomic) IBOutlet UIButton *splusRegisterBt;//注册按钮

@property (strong, nonatomic) IBOutlet UIButton *splusLoginBt;//登录按钮

@property (strong, nonatomic) IBOutlet QCheckBox *splusRemPwd;//记住密码复选框

@property (strong, nonatomic) IBOutlet UILabel *splusForgetPwd;//忘记密码

@end
