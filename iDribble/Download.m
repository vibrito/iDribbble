//
//  Download.m
//  iDribble
//
//  Created by Vinicius Brito on 19/03/15.
//  Copyright (c) 2015 Vinicius. All rights reserved.
//

#import "Download.h"
#import <AFNetworking.h>

@implementation Download

+(void)downloadWithUrl:(NSString*)url callback:(DownloadCallback)callback
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        NSLog(@"JSON: %@", responseObject);
        callback(YES,responseObject);
    }
     
    failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        NSLog(@"Error: %@", error);
    }];
}

@end
