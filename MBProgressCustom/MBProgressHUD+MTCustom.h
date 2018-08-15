//
//  MBProgressHUD+MTCustom.h
//  MBProgressCustom
//
//  Created by Seven on 2018/8/15.
//  Copyright © 2018年 BFMT. All rights reserved.
//

#import "MBProgressHUD.h"
#import <MBProgressHUD.h>


@interface MBProgressHUD (MTCustom)

+ (void)showTipmessageInWindow:(NSString *)message detailMessage:(NSString *)detailMessage;
+ (void)showTipmessageInView:(NSString *)message detailMessage:(NSString *)detailMessage;

+ (void)showSuccessMessage:(NSString *)Message;
+ (void)showErrorMessage:(NSString *)Message;
+ (void)showSuccessMessage:(NSString *)Message detailMessage:(NSString *)detailMessage;
+ (void)showErrorMessage:(NSString *)Message detailMessage:(NSString *)detailMessage;

+ (void)showCustomIconInWindow:(NSString *)iconName message:(NSString *)message;
+ (void)showCustomIconInView:(NSString *)iconName message:(NSString *)message;
+ (void)showCustomIconInWindow:(NSString *)iconName message:(NSString *)message detailMessage:(NSString *)detailMessage;
+ (void)showCustomIconInView:(NSString *)iconName message:(NSString *)message detailMessage:(NSString *)detailMessage;

@end
