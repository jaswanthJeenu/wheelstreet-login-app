//
//  ApiManager.h
//  Login App
//
//  Created by Jaswanth Jeenu on 30/05/16.
//  Copyright © 2016 Jaswanth Jeenu. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ApiManager : NSObject


-(void) makeNetworkCallOfType:(NSString *) httpType withUrl:(NSString *) url andParameters:(NSDictionary *) parameters
        withCompletionHandler:(nullable void (^)(id _Nullable responseObject))completion
        andWithFailureHandler:(nullable void (^)(NSError *error))failure;


@end
