//
//  ViewController.m
//  MBProgressCustom
//
//  Created by Seven on 2018/8/15.
//  Copyright © 2018年 BFMT. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressHUD+MTCustom.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)testAction:(id)sender {
    
//    [MBProgressHUD showCustomIconInWindow:@"toast_icon_done" message:@"支付失败" detailMessage:@"您的余额不足，请充值后继续观看"];
    
//    [MBProgressHUD showTipmessageInWindow:@"支付失败" detailMessage:@"您的余额不足，请充值后继续观看"];
    
    [MBProgressHUD showSuccessMessage:@"已添加到想看"];
}

@end
