//
//  MBProgressHUD+MTCustom.m
//  MBProgressCustom
//
//  Created by Seven on 2018/8/15.
//  Copyright © 2018年 BFMT. All rights reserved.
//

#import "MBProgressHUD+MTCustom.h"

static const NSInteger delay = 1;

@implementation MBProgressHUD (MTCustom)

+ (MBProgressHUD*)createMBProgressHUDviewWithMessage:(NSString*)message detailMessage:(NSString *)detailMessage isWindiw:(BOOL)isWindow
{
    UIView  *view = isWindow? (UIView*)[UIApplication sharedApplication].delegate.window:[self getCurrentUIVC].view;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    hud.square = YES;
    hud.minSize = CGSizeMake(170, 170);
    
    hud.label.text=message?message:@"加载中.....";
    hud.label.font=[UIFont boldSystemFontOfSize:18];

    hud.detailsLabel.text = detailMessage?detailMessage:@"";
    hud.detailsLabel.font = [UIFont systemFontOfSize:13];
    
    hud.removeFromSuperViewOnHide = YES;
    return hud;
}

#pragma mark - text
+ (void)showTipmessageInWindow:(NSString *)message detailMessage:(NSString *)detailMessage{
    [self showTipMessage:message isWindow:true detailMessage:detailMessage timer:delay];
}
+ (void)showTipmessageInView:(NSString *)message detailMessage:(NSString *)detailMessage{
    [self showTipMessage:message isWindow:false detailMessage:detailMessage timer:delay];
}

+ (void)showTipMessage:(NSString*)message isWindow:(BOOL)isWindow detailMessage:(NSString *)detailMessage timer:(int)aTimer
{
    MBProgressHUD *hud = [self createMBProgressHUDviewWithMessage:message detailMessage:[self getDetailLabelText:detailMessage] isWindiw:isWindow];
    hud.mode = MBProgressHUDModeText;
    [hud hideAnimated:YES afterDelay:aTimer];
}

#pragma mark - customView
+ (void)showSuccessMessage:(NSString *)Message{
    [self showCustomIcon:@"toast_icon_done" message:Message detailMessage:@"" isWindow:true];
}
+ (void)showErrorMessage:(NSString *)Message{
    [self showCustomIcon:@"toast_icon_done" message:Message detailMessage:@"" isWindow:true];
}

+ (void)showSuccessMessage:(NSString *)Message detailMessage:(NSString *)detailMessage{
    [self showCustomIcon:@"toast_icon_done" message:Message detailMessage:detailMessage isWindow:true];
}
+ (void)showErrorMessage:(NSString *)Message detailMessage:(NSString *)detailMessage{
    [self showCustomIcon:@"toast_icon_done" message:Message detailMessage:detailMessage isWindow:true];
}

+ (void)showCustomIconInWindow:(NSString *)iconName message:(NSString *)message{
    [self showCustomIcon:iconName message:message detailMessage:@"" isWindow:true];

}
+ (void)showCustomIconInView:(NSString *)iconName message:(NSString *)message {
    [self showCustomIcon:iconName message:message detailMessage:@"" isWindow:false];
}

+ (void)showCustomIconInWindow:(NSString *)iconName message:(NSString *)message detailMessage:(NSString *)detailMessage
{
    [self showCustomIcon:iconName message:message detailMessage:detailMessage isWindow:true];
    
}
+ (void)showCustomIconInView:(NSString *)iconName message:(NSString *)message detailMessage:(NSString *)detailMessage
{
    [self showCustomIcon:iconName message:message detailMessage:detailMessage isWindow:false];
}
+ (void)showCustomIcon:(NSString *)iconName message:(NSString *)message detailMessage:(NSString *)detailMessage isWindow:(BOOL)isWindow
{
    MBProgressHUD *hud  =  [self createMBProgressHUDviewWithMessage:message detailMessage:[self getDetailLabelText:detailMessage] isWindiw:isWindow];
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:iconName]];
    hud.mode = MBProgressHUDModeCustomView;
    [hud hideAnimated:YES afterDelay:delay];
    
}

//获取当前屏幕显示的viewcontroller
+(UIViewController *)getCurrentWindowVC
{
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tempWindow in windows)
        {
            if (tempWindow.windowLevel == UIWindowLevelNormal)
            {
                window = tempWindow;
                break;
            }
        }
    }
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]])
    {
        result = nextResponder;
    }
    else
    {
        result = window.rootViewController;
    }
    return  result;
}
+(UIViewController *)getCurrentUIVC
{
    UIViewController  *superVC = [[self class]  getCurrentWindowVC ];
    
    if ([superVC isKindOfClass:[UITabBarController class]]) {
        
        UIViewController  *tabSelectVC = ((UITabBarController*)superVC).selectedViewController;
        
        if ([tabSelectVC isKindOfClass:[UINavigationController class]]) {
            
            return ((UINavigationController*)tabSelectVC).viewControllers.lastObject;
        }
        return tabSelectVC;
    }else
        if ([superVC isKindOfClass:[UINavigationController class]]) {
            
            return ((UINavigationController*)superVC).viewControllers.lastObject;
        }
    return superVC;
}

+ (NSString *)getDetailLabelText:(NSString *)detailText {
    if (detailText && detailText.length<=11) {
        return detailText;
    }else if (detailText && detailText.length >11){
        NSMutableString *resultString = [[NSMutableString alloc]init];
        for (int i=0; i<detailText.length; i++) {
            if (i>0 && i % 11 == 0) {
                [resultString appendString:@"\n"];
            }
            [resultString appendString:[NSString stringWithFormat:@"%C",[detailText characterAtIndex:i]]];
        }
        return [resultString copy];
    }
    return @"";
}
@end
