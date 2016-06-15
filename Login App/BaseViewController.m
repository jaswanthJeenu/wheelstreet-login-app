//
//  BaseViewController.m
//  Login App
//
//  Created by Jaswanth Jeenu on 28/05/16.
//  Copyright © 2016 Jaswanth Jeenu. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    delegate = [UIApplication sharedApplication].delegate;
}

-(void) showProgressHudWithMessage:(NSString *) message {
    if(progressHUD == nil) {
        progressHUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        [progressHUD setLabelText:message];
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
            // Do something...
        });
    }
}

-(void) hideProgressHUD {
    dispatch_async(dispatch_get_main_queue(), ^{
        if(progressHUD != nil) {
            [progressHUD hideAnimated:YES];
            progressHUD = nil;
        }
    });
}


@end
