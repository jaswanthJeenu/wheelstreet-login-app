//
//  LoginViewController.m
//  Login App
//
//  Created by Jaswanth Jeenu on 28/05/16.
//  Copyright © 2016 Jaswanth Jeenu. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)btnLoginClicked:(id)sender {
    NSString *username = [self.txtUserName.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.txtPassword.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSDictionary *parameters = @{@"mobile": username, @"password": password};
    
    [self showProgressHudWithMessage:@"Logging in"];
    ApiManager *apiManager = [[ApiManager alloc] init];
    
    [apiManager makeNetworkCallOfType:@"POST" withUrl:@"https://api.dev.wheelstreet.in/v1/login" andParameters:parameters withCompletionHandler:^(id  _Nullable responseObject) {
        [self hideProgressHUD];
        NSLog(@"Success response: %@", responseObject);
        if([[responseObject objectForKey:@"success"] boolValue] == YES) {
            NSLog(@"Login successful");
        } else {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Login Failed" message:@"The user name and/or password is incorrect" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
            NSLog(@"Login failed");
        }
        
    } andWithFailureHandler:^(NSError *error) {
        [self hideProgressHUD];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Sorry!" message:@"Unfortunately, your request failed." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];

        NSLog(@"Failure reason: %@", [error localizedDescription]);
    }];
}
@end
