//
//  ApiManager.m
//  Login App
//
//  Created by Jaswanth Jeenu on 30/05/16.
//  Copyright © 2016 Jaswanth Jeenu. All rights reserved.
//

#import "ApiManager.h"
#import "AFNetworking.h"
#import "AFHTTPSessionManager.h"

@implementation ApiManager

-(void)makeNetworkCallOfType:(NSString *)httpType withUrl:(NSString *)url andParameters:(NSDictionary *)parameters withCompletionHandler:(void (^)(id _Nullable))completion andWithFailureHandler:(void (^)(NSError *))failure {
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *accessToken = [defaults stringForKey:@"access_token"];
    if(accessToken != nil) {
        [manager.requestSerializer setValue:[NSString stringWithFormat:@"Bearer %@", accessToken] forHTTPHeaderField:@"Authorization"];
    }
    
    // TODO: Replace the string with enums
    
    if([httpType isEqualToString:@"GET"]) {
        
        [manager GET:url parameters:parameters progress:nil success:^(NSURLSessionTask *task, id responseObject) {
            
            if(completion != nil) {
                completion(responseObject);
            }
        } failure:^(NSURLSessionTask *operation, NSError *error) {
            NSLog(@"Error: %@", error);
            if(failure != nil) {
                failure(error);
            }
        }];
        
    } else if([httpType isEqualToString:@"POST"]) {
        [manager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            if(completion != nil) {
                completion(responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if(failure != nil) {
                failure(error);
            }
        }];
    }
}
@end
