//
//  BaseViewController.h
//  Login App
//
//  Created by Jaswanth Jeenu on 28/05/16.
//  Copyright © 2016 Jaswanth Jeenu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "ApiManager.h"
#import "MBProgressHUD.h"

@interface BaseViewController : UIViewController{
    AppDelegate *delegate;
    MBProgressHUD *progressHUD;
}

-(void) showProgressHudWithMessage:(NSString *) message;
-(void) hideProgressHUD;

@end
